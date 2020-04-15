import java.io.DataOutputStream;
import java.io.IOException;
import java.net.Socket;
import java.util.ArrayList;

public class Server {

    private static int port = 1234;
    private static ArrayList<Socket> clients = new ArrayList<Socket>(10);

    public static void main(String[] args) {
        ServerListener s = null;
        try {
            s = new ServerListener(port);
        } catch (IOException e) {
            System.out.println("Не може да се отвори ServerSocket на порт: " + port);
            return;
        }

        while (true) {
            try {
                Socket clientSocket = s.acceptConnection();
                clients.add(clientSocket);
                new ServerThread(clientSocket);
            } catch (IOException e) {
                System.out.println("Неуспешно свързване на клиент...");
            }
        }
    }

    static void sendToAll(String message) {
        synchronized (clients) {
            for (int i = 0; i < clients.size(); i++) {
                try {
                    DataOutputStream cos = new DataOutputStream(clients.get(i).getOutputStream());
                    cos.writeUTF(message);
                    cos.flush();
                } catch (IOException e) {
                    System.out.println("Не мога да изпратя съобщение...");
                }
            }
        }
    }

    static void removeClient(Socket c) {
        synchronized (clients) {
            System.out.println("Премахвам клиент " + c);
            clients.remove(clients.indexOf(c));
            try {
                c.close();
            } catch (IOException e) {
                System.out.println("Не мога да затворя връзка с клиент");
            }
        }
    }
}