package com.mastek.demo;
import java.util.Scanner;
//ctr+shift+o
import com.mastek.demo.model.Greeting;
public class App {

	public static void main(String[] args) {
		Greeting greeting = new Greeting();
		Scanner sc = new Scanner(System.in);
		System.out.println("Select Greeting Card from following:");
		System.out.println("1. Morning Wishes");
		System.out.println("2. Happy New year");
		System.out.println("3. Happy Birthday");
		String choice = sc.next();
			
//		System.out.println("using ifelse");
//		select_ifelse(greeting, choice);
			
		System.out.println("using switch");
		select_switch(greeting, choice);
			
		System.out.println(greeting.greet());
		sc.close();
	}
	private static void select_switch(Greeting greeting, String choice) {
		switch(choice){
		case "1":
			greeting.setMessage("Good Morning!!!!!!!!!!");
			break;
		case "2":
			greeting.setMessage("Happy New Year !!!!");
			break;
		case "3":
			greeting.setMessage("Happy Birthday!!!");
			break;
		default: break;
		}
	}

	private static void select_ifelse(Greeting greeting, String choice) {
		if (choice.equals("1")) {
			greeting.setMessage("Good Morning!!!!!!!!!!");
		} else if (choice.equals("2")) {
			greeting.setMessage("Happy New Year !!!!");
		} else if (choice.equals("3")) {
			greeting.setMessage("Happy Birthday!!!");
		} else {
			greeting.setMessage("Hello World");
		}
	}
}
