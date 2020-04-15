public class Event {
    private int id;
    private String name;
    private String date;
    private String town;
    private int availablePartipCount;

    public Event(int id, String name, String date, String town, int availablePartipCount) {
        this.id = id;
        this.name = name;
        this.date = date;
        this.town = town;
        this.availablePartipCount = availablePartipCount;
    }
	
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getTown() {
        return town;
    }

    public void setTown(String town) {
        this.town = town;
    }

    public int getAvailablePartipCount() {
        return availablePartipCount;
    }

    public void setAvailablePartipCount(int availablePartipCount) {
        this.availablePartipCount = availablePartipCount;
    }
}