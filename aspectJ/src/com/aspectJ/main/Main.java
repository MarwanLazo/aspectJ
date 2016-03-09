package com.aspectJ.main;

import org.aspectj.lang.annotation.Aspect;

@Aspect
public class Main {

	public static String NAME;

	public void sayHello() {
		System.out.println("Hello============>>");

	}

	public String sayHello(String name) {
		System.out.println("Hello !" + name);
		return name + " 55 ";
	}

	public static void greeting() {
		System.out.println(NAME + "====>> start");
	}

	public static boolean isAdmin() {
		return true;
	}

	public static void main(String[] args) {

		System.out.println("---edited-----");
		String rs = new Main().sayHello("Marwan Lazo 14");
		System.out.println(rs+" -:  rs >>>>>>>>>>>>>>>>>>>>>");
		System.out.println("--------");

	}

}
