package agentes;

import jade.core.Agent;

public class ParamsAgent extends Agent {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void setup() {
		
		Object[] args = getArguments();
		String s;
		
		if(args != null) {
			for(int i = 0; i < args.length; i++) {
				s = (String) args[i];
				System.out.println("p" + i + ": " + s);
			}
			
			// Extraindo o inteiro
			int i = Integer.parseInt( (String) args[0]);
			System.out.println("i*i= " + i*i);
		}
		
	}
	
}
