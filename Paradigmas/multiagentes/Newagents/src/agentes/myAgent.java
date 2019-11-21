package agentes;

import jade.core.Agent;
import jade.core.behaviours.*;

public class myAgent extends Agent {
	
	protected void setup() {
		addBehaviour( new myBehavior( this ));
	}
	
	class myBehavior extends SimpleBehaviour
	{

		public myBehavior(Agent a) {
			// TODO Auto-generated constructor stub
			super(a);
			
		}
		
		@Override
		public void action() {
			// TODO Auto-generated method stub
			System.out.println("Aqui é onde o verdadeiro programa vai!!!");
		}
		
		private boolean finished = true;

		@Override
		public boolean done() {
			// TODO Auto-generated method stub
			System.out.println("Terminando o Agente");
			return finished;
		}
		
	} // Terminando o Agente

}
