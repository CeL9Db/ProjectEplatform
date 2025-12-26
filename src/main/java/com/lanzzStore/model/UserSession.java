package com.lanzzStore.model;



public class UserSession 
{
	private String nickname;
	private String email;
	private boolean loged;
	
	public UserSession(String nickname, String email, boolean loged)
	{
		this.nickname = nickname;
		this.email = email;
		this.loged = loged;
	}
	
	public UserSession() {}

	public String getNickname() {return nickname;}
	public void setNickname(String nickname) {this.nickname = nickname;}
	public String getEmail() {return email;}
	public void setEmail(String email) {this.email = email;}
	public boolean isLoged() {return loged;}
	public void setLoged(boolean loged) {this.loged = loged;}
	
}
