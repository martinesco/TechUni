package restaurant.agents;

import jade.core.Agent;
import jade.core.behaviours.CyclicBehaviour;

public class CyclicAgent extends Agent {
    public CyclicAgent() {

    }

    protected void setup() {
        addBehaviour(new MyNewBehaviour(this));
    }

     class MyNewBehaviour extends CyclicBehaviour {
        private boolean finished = true;
        private int count = 0;

        public MyNewBehaviour(Agent agent) {
            super(agent);
        }

        @Override
        public void action() {
            if (count < 21) {
                System.out.println("Count " + count++);
            } else {
                block();
            }
        }
    }

}
