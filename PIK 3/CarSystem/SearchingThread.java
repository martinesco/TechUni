import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.net.Socket;
import java.util.ArrayList;
import java.util.List;

public class SearchingThread extends Thread {

    private PrintWriter out;
    private String chosenCity;
    private List<Car> carsInCity = new ArrayList<>();

    public SearchingThread(Socket socket, String city) throws IOException {
        this.out = new PrintWriter(new OutputStreamWriter(socket.getOutputStream()));
        this.chosenCity = city;
    }

    public void searchInCity() {
        List<Car> cars = Server.getCars();
        for(Car car : cars) {
            if(car.getCity().equals(this.chosenCity)) {
                carsInCity.add(car);
                out.println(car);
            }
        }
        out.close();
    }

    @Override
    public void run() {
        searchInCity();
    }
}
