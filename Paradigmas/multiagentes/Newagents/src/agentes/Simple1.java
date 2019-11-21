package agentes;

import jade.core.Agent;
import jade.core.behaviours.SimpleBehaviour;

public class Simple1 extends Agent {

	protected void setup() {
		
		addBehaviour(
		
			new SimpleBehaviour (this) {

				private static final long serialVersionUID = 1L;
				int n = 0;
				
				@Override
				public void action() {
					// TODO Auto-generated method stub
					
					System.out.println("Hello World! My name is " + myAgent.getLocalName());
					n++;
					
				}

				@Override
				public boolean done() {
					// TODO Auto-generated method stub
					return n >= 3;
				}
				
			}
				
		);
		
	}
	
}
