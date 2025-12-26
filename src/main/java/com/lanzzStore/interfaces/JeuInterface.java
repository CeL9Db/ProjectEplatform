package com.lanzzStore.interfaces;
import org.springframework.data.jpa.repository.JpaRepository;
import com.lanzzStore.model.Jeu;

public interface JeuInterface extends JpaRepository<Jeu, Integer> 
{
	
}