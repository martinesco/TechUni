import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.net.Socket;
import java.util.List;

public class ReturningThread extends Thread {

    private PrintWriter out;
    private String carId;
    private String city;

    public ReturningThread(Socket socket, String id, String city) throws IOException {
        out = new PrintWriter(new OutputStreamWriter(socket.getOutputStream()));
        this.carId = id;
        this.city = city;
    }

    public void returnCar() {
        List<Car> cars = Server.getCars();

        for(Car car : cars) {
            if(car.getId().equals(carId)) {
                car.setCity(city);
                out.println("Returned!");
                out.flush();
            }
        }
        out.close();
    }

    @Override
    public void run() {
        returnCar();
    }
}
