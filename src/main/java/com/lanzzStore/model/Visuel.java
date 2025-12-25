package com.lanzzStore.model;
import jakarta.persistence.*;
import jakarta.persistence.Id;

@Entity
@Table(name="visuel")
public class Visuel 
{
	@Id
	private int id;
	private String jeu;
	private String highlight;
	private String icon;
	private String video;
	private String img_1;
	private String img_2;
	private String img_3;
	private String img_4;
	private String img_5;
	private String actualite_1;
	private String actualite_2;
	private String actualite_3;
	
	public Visuel() {}

	public int getId() {return id;}
	public void setId(int id) {this.id = id;}
	public String getJeu() {return jeu;}
	public void setJeu(String jeu) {this.jeu = jeu;}
	public String getHighlight() {return highlight;}
	public void setHighlight(String highlight) {this.highlight = highlight;}
	public String getIcon() {return icon;}
	public void setIcon(String icon) {this.icon = icon;}
	public String getVideo() {return video;}
	public void setVideo(String video) {this.video = video;}
	public String getImg_1() {return img_1;}
	public void setImg_1(String img_1) {this.img_1 = img_1;}
	public String getImg_2() {return img_2;}
	public void setImg_2(String img_2) {this.img_2 = img_2;}
	public String getImg_3() {return img_3;}
	public void setImg_3(String img_3) {this.img_3 = img_3;}
	public String getImg_4() {return img_4;}
	public void setImg_4(String img_4) {this.img_4 = img_4;}
	public String getImg_5() {return img_5;}
	public void setImg_5(String img_5) {this.img_5 = img_5;}
	public String getActualite_1() {return actualite_1;}
	public void setActualite_1(String actualite_1) {this.actualite_1 = actualite_1;}
	public String getActualite_2() {return actualite_2;}
	public void setActualite_2(String actualite_2) {this.actualite_2 = actualite_2;}
	public String getActualite_3() {return actualite_3;}
	public void setActualite_3(String actualite_3) {this.actualite_3 = actualite_3;}
	
}
