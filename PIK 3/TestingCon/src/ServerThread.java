import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.net.Socket;
public class ServerThread extends Thread{

    private Socket sock;
    DataOutputStream os;

    public ServerThread(Socket sock){
        this.sock = sock;
        this.start();
    }
    public void run(){
        DataInputStream in;
        String message;
        try{
            in = new DataInputStream(this.sock.getInputStream());
            while(true){
                message = in.readUTF();
                if(message.equals("BYE")){
                    break;
                }
                else{
                    System.out.println(message);
                    Server.sendToAll(message);
                }
            }
        }
        catch(IOException e){
            System.out.println("Проблем с предаване на данни до "+this.sock.toString());
        }
        finally{
            Server.removeClient(this.sock);
        }
    }
}