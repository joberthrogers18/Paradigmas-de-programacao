package agentes;

import jade.core.Agent;
import jade.core.behaviours.SimpleBehaviour;

public class Simple0 extends Agent {
	
	protected void setup() {
		addBehaviour( new B1( this )); 
	}
	
}

class B1 extends SimpleBehaviour
{
	
	public B1( Agent a ) {
		super(a);
	}

	@Override
	public void action() {
		// TODO Auto-generated method stub
		
		System.out.println("Hello World! My name is " + myAgent.getLocalName());
		
	}

	
	private boolean finished = false;
	
	@Override
	public boolean done() {
		// TODO Auto-generated method stub
		return finished;
	}
	
}
