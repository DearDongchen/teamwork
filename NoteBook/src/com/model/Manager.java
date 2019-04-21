package com.model;

public class Manager {
	private int id;
	private String name;
	private String password;
	private String email;
	
	public Manager() {
		this.id=0;
		this.name=null;
		this.password=null;
		this.email=null;
	}
	
	public Manager(int id,String name,String password,String email) {
		this.id=id;
		this.name=name;
		this.password=password;
		this.email=email;
	}
	
	public int getId() {
		return this.id;
	}
	public void setId(int id) {
		this.id=id;
	}
	public String getName() {
		return this.name;
	}
	public void setName(String name) {
		this.name=name;
	}
	public String getPassword() {
		return this.password;
	}
	public void setPassword(String password) {
		this.password=password;
	}
	public String getEmail() {
		return this.email;
	}
	public void setEmail(String email) {
		this.email=email;
	}
}
