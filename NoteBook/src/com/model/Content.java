package com.model;

public class Content {
	int cid;
	String name;
	String title;
	String content;
	String sendTime;
	String degree;//这里表示这篇文章的重要程度
	
	public Content() {
		this.cid=0;
		this.name=null;
		this.title=null;
		this.content=null;
		this.sendTime=null;
		this.degree=null;
	}
	
	public Content(String name,String title,String content,String sendTime,String degree) {
		this.name=name;
		this.title=title;
		this.content=content;
		this.sendTime=sendTime;
		this.degree=degree;
	}
	
	public Content(String name,String title,String content,String degree) {
		this.name=name;
		this.title=title;
		this.content=content;
		this.degree=degree;
	}
	
	public int getId() {
		return cid;
	}
	public void setId(int id) {
		this.cid=id;
	}
	
	public String getName() {
		return this.name;
	}
	public void setName(String name) {
		this.name=name;
	}
	
	public String getTitle() {
		return this.title;
	}
	public void setTitle(String title) {
		this.title=title;
	}
	
	public String getContent() {
		return this.content;
	}
	public void setContent(String content) {
		this.content=content;
	}
	
	public String getSendTime() {
		return this.sendTime;
	}
	public void setSendTime(String time) {
		this.sendTime=time;
	}
	
	public String getDegree() {
		return this.degree;
	}
	public void setDegree(String degree) {
		this.degree=degree;
	}
}
