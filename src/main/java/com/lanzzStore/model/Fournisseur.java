package com.lanzzStore.model;
import jakarta.persistence.*;
import jakarta.persistence.Id;

@Entity
@Table(name="fournisseurs")
public class Fournisseur
{
	@Id
	private int id_fourn;
	private String nom_fourn;
	private String telephone_num_fourn;
	private String email_fourn;
	private String ville_fourn;
	private String adresse_fourn;
	private String url_fourn;
	private String img_fourn;
	
	public Fournisseur() {}

	public int getId_fourn() {return id_fourn;}
	public void setId_fourn(int id_fourn) {this.id_fourn = id_fourn;}
	public String getNom_fourn() {return nom_fourn;}
	public void setNom_fourn(String nom_fourn) {this.nom_fourn = nom_fourn;}
	public String getTelephone_num_fourn() {return telephone_num_fourn;}
	public void setTelephone_num_fourn(String telephone_num_fourn) {this.telephone_num_fourn = telephone_num_fourn;}
	public String getEmail_fourn() {return email_fourn;}
	public void setEmail_fourn(String email_fourn) {this.email_fourn = email_fourn;}
	public String getVille_fourn() {return ville_fourn;}
	public void setVille_fourn(String ville_fourn) {this.ville_fourn = ville_fourn;}
	public String getAdresse_fourn() {return adresse_fourn;}
	public void setAdresse_fourn(String adresse_fourn) {this.adresse_fourn = adresse_fourn;}
	public String getUrl_fourn() {return url_fourn;}
	public void setUrl_fourn(String url_fourn) {this.url_fourn = url_fourn;}
	public String getImg_fourn() {return img_fourn;}
	public void setImg_fourn(String img_fourn) {this.img_fourn = img_fourn;}
	
}
