import jade.core.AID;
import jade.core.Agent;
import jade.domain.DFService;
import jade.domain.FIPAAgentManagement.DFAgentDescription;
import jade.domain.FIPAAgentManagement.ServiceDescription;
import jade.domain.FIPAException;
import jade.lang.acl.ACLMessage;

public class OrangeAgent extends Agent {
    private static final long serialVersionUID = 3L;
    private static String mealName;
    private static String chefName;

    protected void setup() {
        Object[] arguments = getArguments();
        System.out.println("Hello Im Agent " + getLocalName());
        mealName = arguments[0].toString();

        chefName = findCooksName();
        sendMessage(mealName);
    }

    private String findCooksName() {
        DFAgentDescription dfd = new DFAgentDescription();
        ServiceDescription sd = new ServiceDescription();
        sd.setType("cook");
        dfd.addServices(sd);
        DFAgentDescription[] result = null;

        try {
            result = DFService.search(this, dfd);
        } catch (FIPAException e) {
            e.printStackTrace();
        }

        return result[0].getName().toString();
    }

    private void sendMessage(String message) {
        AID r = new AID(chefName, AID.ISLOCALNAME);
        ACLMessage aclMessage = new ACLMessage(ACLMessage.REQUEST);
        aclMessage.addReceiver(r);
        aclMessage.setContent(message);
        this.send(aclMessage);
    }
}
