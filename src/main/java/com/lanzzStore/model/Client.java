package com.lanzzStore.model;

public class Client 
{
	private int id_client; 
	private	String nickname;
	private String email;
	private String password;
	
	public Client(int id_client, String nickname, String email, String password) 
	{
		this.id_client = id_client;
		this.nickname = nickname;
		this.email = email;
		this.password = password;
	}

	public int getId_client() {return id_client;}
	public void setId_client(int id_client) {this.id_client = id_client;}
	public String getNickname() {return nickname;}
	public void setNickname(String nickname) {this.nickname = nickname;}
	public String getEmail() {return email;}
	public void setEmail(String email) {this.email = email;}
	public String getPassword() {return password;}
	public void setPassword(String password) {this.password = password;}
	
	
}
