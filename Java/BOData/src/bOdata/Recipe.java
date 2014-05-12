package bOdata;

public class Recipe
{
   private String recipe_name;
   private int recipe_BOID;
   private String recipe_url;
   private String recipe_img;
   
   public Recipe()
   {
      
   }
   
   public Recipe(String recipe_name, int recipe_BOID, String recipe_url, String recipe_img)
   {
      this.recipe_BOID = recipe_BOID;
      this.recipe_name = recipe_name;
      this.recipe_img = recipe_img;
      this.recipe_url = recipe_url;
   }
   
   public String getRecipe_name()
   {
      return recipe_name;
   }
   public void setRecipe_name( String recipe_name)
   {
      this.recipe_name = recipe_name;
   }
   public int getRecipe_BOID()
   {
      return recipe_BOID;
   }
   public void setRecipe_BOID( int recipe_BOID)
   {
      this.recipe_BOID = recipe_BOID;
   }
   public String getRecipe_url()
   {
      return recipe_url;
   }
   public void setRecipe_url( String recipe_url)
   {
      this.recipe_url = recipe_url;
   }
   public String getRecipe_img()
   {
      return recipe_img;
   }
   public void setRecipe_img( String recipe_img)
   {
      this.recipe_img = recipe_img;
   }
}
