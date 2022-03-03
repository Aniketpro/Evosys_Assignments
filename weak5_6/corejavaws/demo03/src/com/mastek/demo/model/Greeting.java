package com.mastek.demo.model;

public class Greeting {
	private int id;
	private String message;
	private static int counter=1; 
	
	
	public Greeting(String message) {
		this();
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
//	alt+s+c default constructor
//	alt+s+a overloaded constructor
}