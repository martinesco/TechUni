import jade.core.Agent;
import jade.core.behaviours.SimpleBehaviour;
import jade.domain.DFService;
import jade.domain.FIPAAgentManagement.DFAgentDescription;
import jade.domain.FIPAAgentManagement.ServiceDescription;
import jade.domain.FIPAException;
import jade.lang.acl.ACLMessage;
import jade.lang.acl.MessageTemplate;
import restaurant.meal.CookRecipe;
import restaurant.meal.Ingredient;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class BabyAgent extends Agent {

    private static List<CookRecipe> meals = new ArrayList<>();
    private static DFAgentDescription dfd;
    private static ServiceDescription sd;
    private static String mealName;

    protected void setup() {
        Object[] arguments = getArguments();

        System.out.println(String.format("Hello, my name is %s and this is FAST-EASY-DELICIOUS", getLocalName()));

        registerMe();
        addBehaviour(new ResponderBehaviour(this));
        addBehaviour(new CookAndServe(this));
    }

    private void registerMe() {
        dfd = new DFAgentDescription();
        dfd.setName(getAID());
        sd = new ServiceDescription();
        sd.setType("cook");
        sd.setName(getLocalName());
        dfd.addServices(sd);

        try {
            DFService.register(this, dfd);
        } catch (FIPAException fe) {
            fe.printStackTrace();
        }
    }


     static class ResponderBehaviour extends SimpleBehaviour {
        private static final MessageTemplate messageTemplate = MessageTemplate.MatchPerformative(ACLMessage.REQUEST);

        public ResponderBehaviour(Agent agent) {
            super(agent);
        }

        public void action() {
            ACLMessage aclMessage = myAgent.receive(messageTemplate);
            if (aclMessage != null) {
                System.out.println(aclMessage.getContent());
                mealName = aclMessage.getContent();
            } else {
                System.out.println("Nothing here");
                this.block();
            }
        }

        public boolean done() {
            return false;
        }
    }

     class CookAndServe extends SimpleBehaviour {
        public CookAndServe(Agent agent) {
            super(agent);
        }

        @Override
        public void action() {
            cookWithPleasure();
            serve();
        }

        @Override
        public boolean done() {
            return true;
        }

        private void serve() {
            for (CookRecipe obj : meals) {
                if (obj.getName().equalsIgnoreCase(mealName)) {
                    System.out.println(obj.toString());
                    return;
                }
            }
        }

        private void cookWithPleasure() {
            CookRecipe recipe1 = new CookRecipe("Proletna riba");
            recipe1.setInstructions("Konsumiraite zaduljitelno s pone edna butilko ohladeno bqlo vino");
            recipe1.getIngredients().addAll(Arrays.asList(
                    new Ingredient(1, "glava", "luk"),
                    new Ingredient(2, "broya", "cherveni chushki"),
                    new Ingredient(2, "broya", "morkovi"),
                    new Ingredient(3, "broya", "domati"),
                    new Ingredient(2, "skilidki", "star chesun"),
                    new Ingredient(1, "kg", "som"),
                    new Ingredient(1, "konserva", "domati"),
                    new Ingredient(1, "broy", "lyui chushki"),
                    new Ingredient(2, "vrazki", "presen chesun"),
                    new Ingredient(2, "vrazki", "prsen luk"),
                    new Ingredient(70, "gr", "orehi"),
                    new Ingredient(30, "ml", "olio"),
                    new Ingredient(1, "supena lajica", "cherven piper"),
                    new Ingredient(1, "chaena lajica", "zahar")));
            meals.add(recipe1);

            CookRecipe recipe2 = new CookRecipe("Pechen Djolan");
            recipe2.setInstructions("Purvo se peche 30min za 200 gradusa, sled koeto se namalq na 150 gradusa za oshte 150min");
            recipe2.getIngredients().addAll(Arrays.asList(
                    new Ingredient(1, "kg", "svinski djolani"),
                    new Ingredient(2, "broya", "patladjan"),
                    new Ingredient(2, "broya", "morkovi"),
                    new Ingredient(3, "broya", "tikvichki"),
                    new Ingredient(3, "broya", "kartofi"),
                    new Ingredient(1, "glava", "kromid luk"),
                    new Ingredient(6, "skilidki", "chesun"),
                    new Ingredient(200, "ml", "zelenchukov bulyon"),
                    new Ingredient(30, "ml", "olio"),
                    new Ingredient(2, "supeni lajici", "gorchicha"),
                    new Ingredient(1, "chaena lajica", "chubrica"),
                    new Ingredient(1, "supena lajica", "cherven piper"),
                    new Ingredient(1, "vrazka", "magdanoz"),
                    new Ingredient(1, "supena lajica", "sol")));
            meals.add(recipe2);

        }
    }
}