package com.mastek.demo;

public class App {

	public static void main(String[] args) {
		int x=33;
		int y=33;
		System.out.println(2+x*(3+y));
		int num1=9999;
		double dnum1=999.99;
		long num2=999999999999L;
		float fnum1=999.99F;
		int num3='c';
		System.out.println(num3);
		char chnum = 65;
		System.out.println(chnum);
		String snum="1234";
		int result=Integer.parseInt(snum)*2;
		System.out.println(result);
		
		snum="124.99";		
		double dresult=Double.parseDouble(snum)*2;
		System.out.println(dresult);
	}

}
