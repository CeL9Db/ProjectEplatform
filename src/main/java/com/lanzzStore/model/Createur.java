package com.lanzzStore.model;
import jakarta.persistence.*;
import jakarta.persistence.Id;

@Entity
@Table(name="createurs")
public class Createur
{
	@Id
	private int id_createur;
	private String nom_createur;
	
	public Createur() {}
	
	public int getId_createur() {return id_createur;}
	public void setId_createur(int id_createur) {this.id_createur = id_createur;}
	public String getNom_createur() {return nom_createur;}
	public void setNom_createur(String nom_createur) {this.nom_createur = nom_createur;}
	
}