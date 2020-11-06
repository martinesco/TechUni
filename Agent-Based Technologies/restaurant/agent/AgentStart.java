package restaurant.agent;

import jade.core.Agent;
import jade.wrapper.AgentController;
import jade.wrapper.ContainerController;
import jade.wrapper.StaleProxyException;

import java.util.Scanner;

public class AgentStart extends Agent {

    protected void setup() {
        System.out.println("My local name is " + getLocalName());
        System.out.println("Enter meal name:");
        Scanner scanner = new Scanner(System.in);
        String mealName = scanner.nextLine();

        Object[] arguments = {mealName};
        ContainerController c = getContainerController();
        String chefName = "Uti Bachvarov";

        AgentController a = null;
        try {
            a = c.createNewAgent(chefName, "BabyAgent", arguments);
            a.start();
        } catch (StaleProxyException e) {
            e.printStackTrace();
        }
        doDelete();

    }

}
