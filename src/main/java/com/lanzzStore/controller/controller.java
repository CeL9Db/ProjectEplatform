package com.lanzzStore.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.lanzzStore.model.Jeu;
import com.lanzzStore.interfaces.JeuInterface;

@Controller
public class controller 
{	
	@Autowired	// anotation pour avoir l'objet repos directement
	private JeuInterface repos;
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
}
