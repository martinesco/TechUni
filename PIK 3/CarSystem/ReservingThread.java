import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.net.Socket;
import java.util.List;

public class ReservingThread extends Thread {

    private PrintWriter out;
    private String wantedId;
    private String[] wantedDates;
    private boolean isReserved;

    public ReservingThread(Socket socket, String id, String[] dates) throws IOException {
        this.out = new PrintWriter(new OutputStreamWriter(socket.getOutputStream()));
        this.wantedId = id;
        this.wantedDates = dates;
    }

    public void reserveCar() {
        List<Car> cars = Server.getCars();
        for(Car car : cars) {
            if(car.getId().equals(wantedId)) {
                List<String> reservedDates = car.getDates();
                for(String reservedDate : reservedDates) {
                    for(String wantedDate : this.wantedDates) {
                        if(wantedDate.equals(reservedDate)) {
                            out.println("Cannot reserve this car!");
                            out.flush();
                            isReserved = true;
                            break;
                        }

                        if(isReserved) {
                            break;
                        }
                    }
                }
            }
            if(!isReserved) {
                for(String date : wantedDates) {
                    car.setDate(date);
                }
            }
        }

        out.close();
    }

    @Override
    public void run() {
        reserveCar();
    }
}
