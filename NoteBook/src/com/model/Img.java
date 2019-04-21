package com.model;

public class Img {
	int id;
	int userid;
	String path;
	
	public Img() {
		this.id=0;
		this.userid=0;
		this.path=null;
	}
	
	public Img(int userid, String path) {
		this.userid=userid;
		this.path=path;
	}
	
	public int getId() {
		return this.id;
	}
	
	public void setId(int id) {
		this.id=id;
	}
	
	public int getUserid() {
		return this.userid;
	}
	
	public void setUserid(int userid) {
		this.userid=userid;
	}
	
	public String getPath() {
		return this.path;
	}
	
	public void setPath(String path) {
		this.path=path;
	}
}
