package com.lanzzStore.controller;

import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.http.MediaType;
import com.lanzzStore.model.Jeu;
import com.lanzzStore.interfaces.JeuInterface;
import com.lanzzStore.interfaces.ClientInterface;
import com.lanzzStore.model.UserSession;
import jakarta.servlet.http.HttpSession;
import com.lanzzStore.model.Client;

@Controller
public class controller 
{	
	@Autowired	// anotation pour avoir l'objet repos directement
	private JeuInterface repos;
	@Autowired
	private ClientInterface repos_client;
	@Autowired
	private PasswordEncoder cryptePass;
	
	@GetMapping("/")
	public String lanzz_store_main(Model model)
	{	
		List<Jeu> jeu_list = repos.findAll();
		model.addAttribute("Jeux", jeu_list);
		
		Jeu promoted = repos.findById(7).orElse(null);
		model.addAttribute("promotedJeu", promoted);
		return "lanzz_store_main";
	}
	
	@GetMapping("/selectedJeu")
	public String jeu_page(@RequestParam("id") int id, Model model)
	{
		Jeu selectedJeu = repos.findById(id).orElse(null);
		model.addAttribute("selectedJeu", selectedJeu);
		
		return "index";
	}
	
	@PostMapping("/register")
	public String submitForm(@ModelAttribute("user") Client client, Model model)
	{
		if(repos_client.findByEmail(client.getEmail()).orElse(null) != null)
		{
			model.addAttribute("error_inscription", "this email's already exists");
			return "register_page";
		}
		else
		{
			// on récupere le mot de passe -> crypt password -> set le nouveau créé -> enregistrement du nouveau client
			String clientPass = client.getPassword();
			String cryptedPass = cryptePass.encode(clientPass);
			client.setPassword(cryptedPass);
			
			repos_client.save(client);
			return "redirect:/personalPage";
		}
	}
	
	@PostMapping("/login")
	public String login(
						  @RequestParam("email") String email,
						  @RequestParam("password") String password,
						  Model model,
						  HttpSession session
					   )
	{
		Client user = repos_client.findByEmail(email).orElse(null);
		if(user != null && user.getPassword().equals(password))
		{
			System.out.println("User's successfully found.");
			UserSession userSession = new UserSession(user.getNickname(), user.getEmail(), true);	// add a session
			session.setAttribute("userSession", userSession);
			// redirect directly to user's account
			return "redirect:/personalPage";
		}
		else
		{
			// if not we say that smth went wrong with his info
			System.out.println("User is not found. Please register yourself");
			model.addAttribute("error_connection", "something went wrong, try agail...");
			return "redirect:/loginPage";
		}
	}

@PostMapping(value = "/addToFav", produces = MediaType.APPLICATION_JSON_VALUE)
@ResponseBody
public List<Jeu> addToPanier(@RequestParam("id_produit") int id_produit, HttpSession session) 
{
    List<Jeu> panier = (List<Jeu>) session.getAttribute("panier");
    
    if (panier == null) {panier = new ArrayList<>();}
    
    Jeu jeuToAdd = repos.findById(id_produit).orElse(null);
    
    if (jeuToAdd != null) {panier.add(jeuToAdd);}
    
    session.setAttribute("panier", panier);
    return panier; 
}

    @GetMapping("/supprimer_article")
    public String removeFromPanier(@RequestParam("id_produit") int id_produit, HttpSession session) 
	{
        List<Jeu> panier = (List<Jeu>) session.getAttribute("panier");
        
        if (panier != null && id_produit >= 0 && id_produit < panier.size()) {panier.remove(id_produit);}
        
        session.setAttribute("panier", panier); // session update
        return "redirect:/favorPage";
    }

	// direct links
	@GetMapping("/registerPage")
	public String showFormRegister(Model model)
	{
		model.addAttribute("user", new Client());
		return "register_page";
	}
	@GetMapping("/loginPage")
	public String showFormLogin() {return "login_page";}
	@GetMapping("/personalPage")
	public String directPersonalPage(HttpSession session, Model model) 
	{
		UserSession userSession = (UserSession) session.getAttribute("userSession");
		model.addAttribute("userSession", userSession);
		return "personal_page";
	}
	@GetMapping("/personalPageCle")
	public String directPersonalPageCle(HttpSession session, Model model) 
	{
		UserSession userSession = (UserSession) session.getAttribute("userSession");
		model.addAttribute("userSession", userSession);
		return "personal_page_cle";
	}
	@GetMapping("/personalPageCommSup")
	public String directPersonalPageCommSup(HttpSession session, Model model) 
	{
		UserSession userSession = (UserSession) session.getAttribute("userSession");
		model.addAttribute("userSession", userSession);
		return "personal_page_CommSup";
	}
	@GetMapping("/personalPageHistory")
	public String directPersonalPageHistory(HttpSession session, Model model) 
	{
		UserSession userSession = (UserSession) session.getAttribute("userSession");
		model.addAttribute("userSession", userSession);
		return "personal_page_histoire";
	}
	//////////////////////////////////
	// complete the logout processus
	//@GetMapping("/logout")
	//public String directLogout() {return "lanzz_store_main";}
	// complete the commantaire processus
	//@GetMapping("/commentaire")
	//public String directCommentaire() {return "commentaire_page";}
	// complete the personalPage
	//@GetMapping("/personalPage")
	//public String PersonalPage()
	//////////////////////////////////
	
	@GetMapping("/assistance_page")
	public String directAssistPage() {return "assistance_page";}
	@GetMapping("/politique")
	public String directPolitique() {return "politique_de_confidentialite";}
	@GetMapping("/favorPage")
	public String directFavorite() {return "favor_page";}
	@GetMapping("/search")
	public String directSearch() {return "search";}
}
