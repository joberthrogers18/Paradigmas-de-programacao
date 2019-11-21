package javaHello;

import jade.core.Agent;

public class HelloAgent extends Agent {
	
	public void setup() {
		System.out.println("Hello Mans");
		System.out.println("Meu nome é :" + getLocalName());
	}
	
}
