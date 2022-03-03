package com.mastek.demo.model;

public class Greeting {
	private int id;
	private String message;
	private static int counter=1; 
	
	
	public Greeting(String message) {
		this();
		this.message = message;
	}


	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public String getMessage() {
		return message;
	}


	public void setMessage(String message) {
		this.message = message;
	}


	public Greeting(int id, String message) {
		this.id = id;
		this.message = message;
	}


	public Greeting() {
		this.id=counter++;
	}


	public String greet() {
		return this.id+" "+this.message;
	}
	
//	alt+s,r for getters and setters
}