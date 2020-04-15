import java.io.IOException;
import java.io.ObjectOutputStream;
import java.io.PrintWriter;
import java.net.Socket;
import java.util.Scanner;

public class ServerThread extends Thread {

    private Socket socket;
    private PrintWriter out;
    private Scanner in;

    public ServerThread(Socket socket) throws IOException {
        this.socket = socket;
        this.out = new PrintWriter(new ObjectOutputStream(socket.getOutputStream()));
        this.in = new Scanner(socket.getInputStream());
    }

    public void clientCheck() throws IOException {
        out.println("Enter:\n1 for searching\n2 for reserving\n3 for returning");
        out.flush();
        int check = in.nextInt();
        if (check == 1) {
            out.println("Enter city name:");
            out.flush();
            String city = in.nextLine();
            new SearchingThread(socket, city).start();
        }
        if (check == 2) {
            out.println("Enter id and dates:");
            out.flush();
            String id = in.nextLine();
            String[] dates = in.nextLine().split("/");
            new ReservingThread(socket, id, dates).start();
        }
        if (check == 3) {
            out.println("Enter id and city:");
            out.flush();
            String id = in.nextLine();
            String city = in.nextLine();
            new ReturningThread(socket, id, city).start();
        }
        out.close();
        in.close();
    }

    @Override
    public void run() {
        try {
            clientCheck();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
