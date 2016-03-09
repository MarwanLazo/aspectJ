package com.aspectJ.main;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

public aspect HelloAspectJ {

	pointcut sayHello(): call(static * Main.gree*(..));

	before() : sayHello() {
		if (Main.isAdmin()) {
			Main.NAME = " Marwan Lazo ";
			System.out.println("Before call sayHello");
		} else {
			System.out.println("Acess denied");
			System.exit(0);
		}

	}

	after() : sayHello()  {
		Main.NAME = null;
		System.out.println("After call sayHello");
	}

	pointcut hello(String name) : call(String Main.sayHello(String))
    && args(name);

	after(String name) returning(String rs) :  hello(name){
		System.out.println((name + " in  88").toUpperCase());
		System.out.println((rs + " out 89").toUpperCase());
	};

	after(String name)  :  hello(name){
		System.out.println((name + " finish  90").toUpperCase());
	};

	before(String name)  :  hello(name){
		System.out.println((name + " Start  90"));
	};

	String around(String watched) : hello(watched)  {

		Object value = null;

		String getterName = thisJoinPoint.getSignature().getName();

		try {
			Method method = Main.class.getMethod(getterName, String.class);

			Object[] arg = { watched };
			value = method.invoke(new Main(), arg);
		} catch (NoSuchMethodException e) {

			e.printStackTrace();
		} catch (SecurityException e) {

			e.printStackTrace();
		} catch (IllegalAccessException e) {

			e.printStackTrace();
		} catch (IllegalArgumentException e) {

			e.printStackTrace();
		} catch (InvocationTargetException e) {

			e.printStackTrace();
		}
		System.out.println(watched);
		proceed(watched);
		System.out.println(watched);
		return ((String) value).toUpperCase();
	}
}
