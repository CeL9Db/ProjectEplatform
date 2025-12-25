package com.lanzzStore.model;

import jakarta.persistence.*;

@Entity
@Table(name="type_produit")
public class Type_produit 
{
	@Id
	private int id_type;
	private String nom;
	
	public Type_produit() {}
	public int getId_type() {return id_type;}
	public void setId_type(int id_type) {this.id_type = id_type;}
	public String getNom() {return nom;}
	public void setNom(String nom) {this.nom = nom;}
	
}
