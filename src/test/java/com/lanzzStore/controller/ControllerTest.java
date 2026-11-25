package com.lanzzStore.controller;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertNull;
import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.hamcrest.Matchers.nullValue;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.never;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.view;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.junit.jupiter.api.Test;
import org.mockito.ArgumentCaptor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.context.annotation.Import;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.bean.override.mockito.MockitoBean;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;

import com.lanzzStore.config.Securitycfg;
import com.lanzzStore.interfaces.ClientInterface;
import com.lanzzStore.interfaces.JeuInterface;
import com.lanzzStore.model.Client;
import com.lanzzStore.model.Jeu;
import com.lanzzStore.model.UserSession;

// Tests du contrôleur sans base de données : les repositories sont remplacés par des mocks
@WebMvcTest(controller.class)
@Import(Securitycfg.class)
class ControllerTest
{
	@Autowired
	private MockMvc mockMvc;

	@Autowired
	private PasswordEncoder passwordEncoder;	// le vrai BCrypt de Securitycfg

	@MockitoBean
	private JeuInterface repos;

	@MockitoBean
	private ClientInterface repos_client;

	// petites méthodes pour créer les objets de test
	private Jeu creerJeu(int id, String nom)
	{
		Jeu jeu = new Jeu();
		jeu.setId(id);
		jeu.setNom_produit(nom);
		return jeu;
	}

	private Client creerClient(String nickname, String email, String password)
	{
		Client client = new Client();
		client.setNickname(nickname);
		client.setEmail(email);
		client.setPassword(password);
		return client;
	}

	// ---------- catalogue ----------

	@Test
	void accueil_afficheTousLesJeuxEtLeJeuMisEnAvant() throws Exception
	{
		Jeu eldenRing = creerJeu(7, "Elden Ring");
		List<Jeu> catalogue = List.of(creerJeu(1, "Minecraft"), eldenRing);
		when(repos.findAll()).thenReturn(catalogue);
		when(repos.findById(7)).thenReturn(Optional.of(eldenRing));

		mockMvc.perform(get("/"))
			.andExpect(status().isOk())
			.andExpect(view().name("lanzz_store_main"))
			.andExpect(model().attribute("Jeux", catalogue))
			.andExpect(model().attribute("promotedJeu", eldenRing));
	}

	@Test
	void ficheJeu_afficheLeJeuDemande() throws Exception
	{
		Jeu jeu = creerJeu(3, "Hollow Knight");
		when(repos.findById(3)).thenReturn(Optional.of(jeu));

		mockMvc.perform(get("/selectedJeu").param("id", "3"))
			.andExpect(status().isOk())
			.andExpect(view().name("index"))
			.andExpect(model().attribute("selectedJeu", jeu));
	}

	@Test
	void ficheJeu_jeuInconnu_renvoieNull() throws Exception
	{
		when(repos.findById(99)).thenReturn(Optional.empty());

		mockMvc.perform(get("/selectedJeu").param("id", "99"))
			.andExpect(status().isOk())
			.andExpect(view().name("index"))
			.andExpect(model().attribute("selectedJeu", nullValue()));
	}

	// ---------- inscription ----------

	@Test
	void inscription_emailDejaUtilise_afficheUneErreur() throws Exception
	{
		when(repos_client.findByEmail("vlad@mail.fr"))
			.thenReturn(Optional.of(creerClient("vlad", "vlad@mail.fr", "x")));

		mockMvc.perform(post("/register")
				.param("nickname", "autre")
				.param("email", "vlad@mail.fr")
				.param("password", "secret"))
			.andExpect(status().isOk())
			.andExpect(view().name("register_page"))
			.andExpect(model().attributeExists("error_inscription"));

		verify(repos_client, never()).save(any());
	}

	@Test
	void inscription_nouveauClient_motDePasseChiffreAvantEnregistrement() throws Exception
	{
		when(repos_client.findByEmail("nouveau@mail.fr")).thenReturn(Optional.empty());

		mockMvc.perform(post("/register")
				.param("nickname", "nouveau")
				.param("email", "nouveau@mail.fr")
				.param("password", "secret"))
			.andExpect(view().name("redirect:/personalPage"));

		// on récupère le client réellement envoyé au repository
		ArgumentCaptor<Client> captor = ArgumentCaptor.forClass(Client.class);
		verify(repos_client).save(captor.capture());
		Client enregistre = captor.getValue();

		assertEquals("nouveau", enregistre.getNickname());
		assertNotEquals("secret", enregistre.getPassword());	// pas en clair
		assertTrue(passwordEncoder.matches("secret", enregistre.getPassword()));
	}

	// ---------- connexion ----------

	@Test
	void connexion_bonMotDePasse_creeLaSessionUtilisateur() throws Exception
	{
		Client client = creerClient("vlad", "vlad@mail.fr", passwordEncoder.encode("secret"));
		when(repos_client.findByEmail("vlad@mail.fr")).thenReturn(Optional.of(client));

		MvcResult resultat = mockMvc.perform(post("/login")
				.param("email", "vlad@mail.fr")
				.param("password", "secret"))
			.andExpect(view().name("redirect:/personalPage"))
			.andReturn();

		UserSession session = (UserSession) resultat.getRequest().getSession().getAttribute("userSession");
		assertNotNull(session);
		assertEquals("vlad", session.getNickname());
		assertEquals("vlad@mail.fr", session.getEmail());
		assertTrue(session.isLoged());
	}

	@Test
	void connexion_mauvaisMotDePasse_pasDeSession() throws Exception
	{
		Client client = creerClient("vlad", "vlad@mail.fr", passwordEncoder.encode("secret"));
		when(repos_client.findByEmail("vlad@mail.fr")).thenReturn(Optional.of(client));

		MvcResult resultat = mockMvc.perform(post("/login")
				.param("email", "vlad@mail.fr")
				.param("password", "faux"))
			.andExpect(view().name("redirect:/loginPage"))
			.andReturn();

		assertNull(resultat.getRequest().getSession().getAttribute("userSession"));
	}

	@Test
	void connexion_emailInconnu_redirigeVersLaConnexion() throws Exception
	{
		when(repos_client.findByEmail("inconnu@mail.fr")).thenReturn(Optional.empty());

		mockMvc.perform(post("/login")
				.param("email", "inconnu@mail.fr")
				.param("password", "secret"))
			.andExpect(view().name("redirect:/loginPage"));
	}
}
