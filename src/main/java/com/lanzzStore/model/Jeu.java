package com.lanzzStore.model;

import jakarta.persistence.*;
import jakarta.persistence.Id;

//	class bean pour décrire un jeu
@Entity
@Table(name="produits")
public class Jeu 
{
	@Id
	private int id_produit;
	private String nom_produit;
	
	@ManyToOne
	@JoinColumn(name="code_type_produit")
	private Type_produit code_type_produit;
	private float prix_produit;
	private String restriction_age;
	private String date_sortie;
	
	@ManyToOne
	@JoinColumn(name="code_fourn")
	private Fournisseur code_fourn;
	
	@ManyToOne
	@JoinColumn(name="code_createur")
	private Createur code_createur;
	private String img;
	private String url;
	private String video;
	
	@ManyToOne
	@JoinColumn(name="code_commentaire")
	private Commentaire code_commentaire;
	private String grid_placement;
	private String link_telechargement;
	
	@OneToOne
	@JoinColumn(name="code_visuel")
	private Visuel code_visuel;
	
	public Jeu() {}
	
	
	//	getters/setters
	public int getId() {return id_produit;}
	public void setId(int id_produit) {this.id_produit = id_produit;}
	public String getNom_produit() {return nom_produit;}
	public void setNom_produit(String nom_produit) {this.nom_produit = nom_produit;}
	public Type_produit getCode_type_produit() {return code_type_produit;}
	public void setCode_type_produit(Type_produit code_type_produit) {this.code_type_produit = code_type_produit;}
	public float getPrix_produit() {return prix_produit;}
	public void setPrix_produit(float prix_produit) {this.prix_produit = prix_produit;}
	public String getRestriction_age() {return restriction_age;}
	public void setRestriction_age(String restriction_age) {this.restriction_age = restriction_age;}
	public String getDate_sortie() {return date_sortie;}
	public void setDate_sortie(String date_sortie) {this.date_sortie = date_sortie;}
	public Fournisseur getCode_fourn() {return code_fourn;}
	public void setCode_fourn(Fournisseur code_fourn) {this.code_fourn = code_fourn;}
	public Createur getCode_createur() {return code_createur;}
	public void setCode_createur(Createur code_createur) {this.code_createur = code_createur;}
	public String getImg() {return img;}
	public void setImg(String img) {this.img = img;}
	public String getUrl() {return url;}
	public void setUrl(String url) {this.url = url;}
	public String getVideo() {return video;}
	public void setVideo(String video) {this.video = video;}
	public Commentaire getCode_commentaire() {return code_commentaire;}
	public void setCode_commentaire(Commentaire code_commentaire) {this.code_commentaire = code_commentaire;}
	public String getGrid_placement() {return grid_placement;}
	public void setGrid_placement(String grid_placement) {this.grid_placement = grid_placement;}
	public String getLink_telechargement() {return link_telechargement;}
	public void setLink_telechargement(String link_telechargement) {this.link_telechargement = link_telechargement;}
	public Visuel getCode_visuel() {return code_visuel;}
	public void setCode_visuel(Visuel code_visuel) {this.code_visuel = code_visuel;}
	
	
}