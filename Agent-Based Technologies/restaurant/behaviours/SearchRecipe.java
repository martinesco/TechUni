package restaurant.behaviours;

import jade.core.behaviours.SimpleBehaviour;
import restaurant.meal.CookRecipe;

public class SearchRecipe extends SimpleBehaviour {

    private static final long serialVersionUID = 1L;
    private boolean finished = false;

    @Override
    public void action() {
        CookRecipe tempRecipe = null;
        for (CookRecipe obj : CreateRecipes.recipes) {
            if (obj.getName().equalsIgnoreCase(getAgent().getArguments()[0].toString())) {
                tempRecipe = obj;
            }
            if (tempRecipe != null) {
                System.out.println(tempRecipe);
                finished = true;
            }
        }
    }

    @Override
    public boolean done() {
        return false;
    }
}
