package com.javaex.vo;

public class GuestVO {

	
	String no ; 
	String name;
	String password;
	String content;
	String date;
	
	public String getNo() {
		return no;
	}
	public void setNo(String no) {
		this.no = no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	@Override
	public String toString() {
		return "GuestVO [no=" + no + ", name=" + name + ", password=" + password + ", content=" + content + ", date="
				+ date + "]";
	}
	
	

}
