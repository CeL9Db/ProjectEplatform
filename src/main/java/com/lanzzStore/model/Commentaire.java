package com.lanzzStore.model;
import jakarta.persistence.*;
import jakarta.persistence.Id;

@Entity
@Table(name="commentaire")
public class Commentaire 
{
	@Id
	private int id_commentaire;
	private String commentaire_jeu;
	private String commentaire_site;
	private int code_commentaire;
	
	public Commentaire() {}

	public int getId_commentaire() {return id_commentaire;}
	public void setId_commentaire(int id_commentaire) {this.id_commentaire = id_commentaire;}
	public String getCommentaire_jeu() {return commentaire_jeu;}
	public void setCommentaire_jeu(String commentaire_jeu) {this.commentaire_jeu = commentaire_jeu;}
	public String getCommentaire_site() {return commentaire_site;}
	public void setCommentaire_site(String commentaire_site) {this.commentaire_site = commentaire_site;}
	public int getCode_commentaire() {return code_commentaire;}
	public void setCode_commentaire(int code_commentaire) {this.code_commentaire = code_commentaire;}
	
	
}
