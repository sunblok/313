package bOdata;

import java.util.List;

public interface BOFace
{
   boolean createScripture(Recipe newRecipe);
   Recipe getRecipe(int recipeId);
   List<Recipe> getAllRecipies();
}
