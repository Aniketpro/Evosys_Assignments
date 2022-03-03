package com.mastek.demo;

import java.util.Scanner;

import com.mastek.demo.model.Greeting;

public class App {

	public static void main(String[] args) {
		Greeting greeting =new Greeting();
		Scanner sc = new Scanner(System.in);
//		usingFor(greeting, sc);
//		usingWhile(greeting, sc);
//		usingDowhile(greeting, sc);
		
		int i=0;
		boolean test=true;
		while(test){
			i++;
			if(i%17==0){
				continue;
			}
			else if(i%57==0){
				break;
			}
			System.out.println(i+", ");
			
			
		}
		sc.close();
	}

	private static void usingDowhile(Greeting greeting, Scanner s) {
		boolean test=true;
		int i=0;
		do{
			selectCard(greeting, s, i);
			System.out.println("Do you want to select another card? y/n ");
			String choice=s.next();
			if(choice.equalsIgnoreCase("n")){
				test=false;
			}
		}while(test);
	}

	private static void usingWhile(Greeting greeting, Scanner sc) {
		boolean test=true;
		int i=0;
		while(test){
			selectCard(greeting, sc, ++i);
			System.out.println("Do you want to select another card? y/n ");
			String choice=sc.next();
			if(choice.equalsIgnoreCase("n")){
				test=false;
			}
			
		}
	}

	private static void usingFor(Greeting greeting, Scanner sc) {
		for (int i = 1; i < 4; i++) {			
			selectCard(greeting, sc, i);
		}
	}

	private static void selectCard(Greeting greeting, Scanner sc, int i) {
		System.out.println("Select "+i+ " Greeting Card");
		System.out.println("1. Morning Wishes");
		System.out.println("2. Happy New year");
		System.out.println("3. Happy Birthday");
		String choice = sc.next();
		switch (choice) {
		case "1":
			greeting.setMessage("Good Morning!!!!!!!!!!");
			break;
		case "2":
			greeting.setMessage("Happy New Year !!!!");
			break;
		case "3":
			greeting.setMessage("Happy Birthday!!!");
			break;
		default:
			greeting.setMessage("Hello World");
			break;
		}
		System.out.println(greeting.greet());
	}
}
