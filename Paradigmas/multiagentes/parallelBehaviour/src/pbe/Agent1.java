package pbe;

import jade.core.Agent;
import jade.core.behaviours.SimpleBehaviour;

public class Agent1 extends Agent{
	
	private static final long serialVersionUID = 1L;

	public void setup() {
		addBehaviour(new Looper(this, 300));
		addBehaviour(new Looper(this, 500));
	}

	class Looper extends SimpleBehaviour
	{
		private static final long serialVersionUID = 1L;
		
		String offset = "";
		long   t0     = System.currentTimeMillis();
		
		String tab = "" ;
		int    n   = 1;
		long   dt;
		
		public Looper( Agent a, long dt) {
			super(a);
			this.dt = dt;
			offset += "    " ;
	   		tab = new String(offset) ;
		}
		
		public void action() 
		{
			System.out.println( tab + 
			   (System.currentTimeMillis()-t0)/10*10 + ": " +
				myAgent.getLocalName() );
			block( dt );
			n++;
		}
		
		public  boolean done() {  return n>6;  }

	}
	
}
