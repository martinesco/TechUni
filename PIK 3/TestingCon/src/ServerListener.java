import java.io.IOException;
import java.net.ServerSocket;
import java.net.Socket;

public class ServerListener{

    private ServerSocket servSock;

    public ServerListener(int port) throws IOException{

        servSock = new ServerSocket(port);

        System.out.println("Сървърът е стартиран и слуша на порт: "+port);
    }

    public Socket acceptConnection() throws IOException{
        Socket s = this.servSock.accept();
        System.out.println("Нов клиент "+s.toString());
        return s;
    }
}