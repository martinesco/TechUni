import java.util.ArrayList;
import java.util.List;

public class Car {
    private String city;
    private String id;
    private List<String> dates = new ArrayList<>();

    public String getCity() {
        return this.city;
    }

    public String getId() {
        return this.id;
    }

    public List<String> getDates() {
        return this.dates;
    }

    public void setDate(String date) {
        this.dates.add(date);
    }

    public void setCity(String city) {
        this.city = city;
    }
}
