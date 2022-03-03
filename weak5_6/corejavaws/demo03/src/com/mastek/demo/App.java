package com.mastek.demo;
import com.mastek.demo.model.*;

public class App {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Greeting greeting1 = new Greeting("Hello World");
		Greeting greeting2 = new Greeting("Good Morning");
		Greeting greeting3 = new Greeting("Hii");
		System.out.println(greeting1.greet());
		System.out.println(greeting2.greet());
		System.out.println(greeting3.greet());
	}
}