package restaurant.meal;

import java.util.ArrayList;
import java.util.List;

public class CookRecipe {

    private String name;
    private String instructions;
    private List<Ingredient> ingredients;

    public CookRecipe(String name) {
        this.name = name;
        this.ingredients = new ArrayList<>();
    }

    public void addIngredients(Ingredient ingredient) {
        this.ingredients.add(ingredient);
    }

    public String getName() {
        return name;
    }

    public void setInstructions(String instructions) {
        this.instructions = instructions;
    }

    public List<Ingredient> getIngredients() {
        return ingredients;
    }

    @Override
    public String toString() {
        String recipeName = String.format("\t # # #   %s   # # #%n", this.name);
        StringBuilder sb = new StringBuilder();
        sb.append(recipeName);
        for (Ingredient ingredient : this.ingredients) {
            sb.append(ingredient.toString()).append(System.lineSeparator());
        }
        sb.append(this.instructions).append(System.lineSeparator());

        return sb.toString();
    }
}