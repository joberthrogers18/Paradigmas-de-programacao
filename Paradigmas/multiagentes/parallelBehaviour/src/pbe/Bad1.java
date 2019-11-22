package pbe;

import jade.core.Agent;
import jade.core.behaviours.SimpleBehaviour;

public class Bad1 extends Agent {

	private static final long serialVersionUID = 1L;

	public void setup() {
		
		addBehaviour(new TwoStep());
		addBehaviour(new Looper(this, 300));
		
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
	
	class TwoStep extends SimpleBehaviour {
		
		private static final long serialVersionUID = 1L;
		public boolean finished = false;
		
		@Override
		public void action() {
			block(250);
	        System.out.println( "--- Message 1 --- " );
	        block(500);
	        System.out.println( "    - message 2 " );
	        this.finished = true;
		}

		@Override
		public boolean done() {
			// TODO Auto-generated method stub
			return finished;
		}
		
	}
	
	
}
