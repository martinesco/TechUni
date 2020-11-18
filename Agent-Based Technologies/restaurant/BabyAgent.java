import jade.core.Agent;
import restaurant.meal.CookRecipe;
import restaurant.meal.Ingredient;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class BabyAgent extends Agent {

    private static List<CookRecipe> meals = new ArrayList<>();

    protected void setup() {
        Object[] arguments = getArguments();

        System.out.println(String.format("Hello, my name is %s and this is FAST-EASY-DELICIOUS", getLocalName()));

        cookWithPleasure();
        serve(arguments[0].toString());

        doDelete();
    }

    private void serve(String name) {
        CookRecipe recipeTemp = null;
        int counter = 0;
        for (CookRecipe obj : meals) {
            if (obj.getName().equalsIgnoreCase(name)) {
                recipeTemp = obj;
                System.out.println(recipeTemp);
                counter++;
            }
            if (counter == 0) {
                System.out.println("Meal not found!");
            }
        }
    }


    private void cookWithPleasure() {
        CookRecipe recipe1 = new CookRecipe("Proletna riba");
        recipe1.setInstructions("Konsumiraite zaduljitelno s pone edna butilko ohladeno bqlo vino");
        recipe1.getIngredients().addAll(Arrays.asList(
                new Ingredient(1, "glava", "luk"),
                new Ingredient(2, "broya", "cherveni chushki"),
                new Ingredient(2, "broya", "morkovi"),
                new Ingredient(3, "broya", "domati"),
                new Ingredient(2, "skilidki", "star chesun"),
                new Ingredient(1, "kg", "som"),
                new Ingredient(1, "konserva", "domati"),
                new Ingredient(1, "broy", "lyui chushki"),
                new Ingredient(2, "vrazki", "presen chesun"),
                new Ingredient(2, "vrazki", "prsen luk"),
                new Ingredient(70, "gr", "orehi"),
                new Ingredient(30, "ml", "olio"),
                new Ingredient(1, "supena lajica", "cherven piper"),
                new Ingredient(1, "chaena lajica", "zahar")));
        meals.add(recipe1);

        CookRecipe recipe2 = new CookRecipe("Pechen Djolan");
        recipe2.setInstructions("Purvo se peche 30min za 200 gradusa, sled koeto se namalq na 150 gradusa za oshte 150min");
        recipe2.getIngredients().addAll(Arrays.asList(
                new Ingredient(1, "kg", "svinski djolani"),
                new Ingredient(2, "broya", "patladjan"),
                new Ingredient(2, "broya", "morkovi"),
                new Ingredient(3, "broya", "tikvichki"),
                new Ingredient(3, "broya", "kartofi"),
                new Ingredient(1, "glava", "kromid luk"),
                new Ingredient(6, "skilidki", "chesun"),
                new Ingredient(200, "ml", "zelenchukov bulyon"),
                new Ingredient(30, "ml", "olio"),
                new Ingredient(2, "supeni lajici", "gorchicha"),
                new Ingredient(1, "chaena lajica", "chubrica"),
                new Ingredient(1, "supena lajica", "cherven piper"),
                new Ingredient(1, "vrazka", "magdanoz"),
                new Ingredient(1, "supena lajica", "sol")));
        meals.add(recipe2);

    }
}
