package com.lanzzStore.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.web.servlet.server.Session;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
	public String submitForm(@ModelAttribute("user") Client client)
	{
		return "register_page";
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
			session.setAttribute("session", userSession);
			// redirect directly to user's account
			return "redirect:/personal_page";
		}
		else
		{
			// if not we say that smth went wrong with his info
			System.out.println("User is not found. Please register yourself");
			model.addAttribute("error_connection", "something went wrong");
			return "login_page";
		}
	}
	
	// direct links
	@GetMapping("/registerPage")
	public String showFormRegister(Model model)
	{
		model.addAttribute("user", new Client());
		return "register_page";
	}
	@GetMapping("/loginPage")
	public String showFormLogin()
	{
		return "login_page";
	}
//	@GetMapping("/personal_page")
//	public String showPersonelPage(Model model, HttpSession session)
//	{
//		// a finir + a finir register_page et son controlleur
//	}
}
