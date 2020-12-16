import jade.core.Agent;
import jade.wrapper.AgentController;
import jade.wrapper.ContainerController;
import jade.wrapper.StaleProxyException;

import java.util.Scanner;

public class AgentStart extends Agent {

    public void setup() {
        System.out.println("My local name is " + getLocalName());
        System.out.println("Enter meal name:");
        Scanner scanner = new Scanner(System.in);
        String mealName = scanner.nextLine();

        Object[] arguments = {mealName};
        ContainerController c = getContainerController();

        String someName = "Mike";
        String chefName = "Uti Bachvarov";

        try {
            AgentController orange = c.createNewAgent(someName, "OrangeAgent", arguments);
            orange.start();

            AgentController a = c.createNewAgent(chefName, "BabyAgent", null);
            a.start();

        } catch (StaleProxyException e) {
            e.printStackTrace();
        }
        doDelete();
    }

}
