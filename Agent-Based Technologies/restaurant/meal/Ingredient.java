package restaurant.meal;

public class Ingredient {

    private double measure;
    private String unitOfMeasure;
    private String name;

    public Ingredient(double measure, String unitOfMeasure, String name) {
        this.measure = measure;
        this.unitOfMeasure = unitOfMeasure;
        this.name = name;
    }

    @Override
    public String toString() {
        return String.format("\t%s %s %s", measure, unitOfMeasure, name);
    }
}
