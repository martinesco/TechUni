import java.io.IOException;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class Server {
    private static List<Car> cars = new ArrayList<>();

    public static void main(String[] args) throws IOException {
        ServerSocket serverSocket = new ServerSocket(6070);
        while (true) {
            Socket socket = serverSocket.accept();
            new ServerThread(socket).start();
        }
    }

    public static List<Car> getCars() {
        return Collections.unmodifiableList(cars);
    }
}
