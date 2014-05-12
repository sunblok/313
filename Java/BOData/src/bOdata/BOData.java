package bOdata;

import java.io.StringReader;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;
import org.xml.sax.SAXException;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

public class BOData implements BOFace
{
   
   private final String DB_CONNECTION = "jdbc:mysql://localhost/scriptures"; 
   
   public void parseXML(String xml)
   {
      try
     {
        Document doc = loadXMLFromString(xml);
     // Get the document's root XML node
        Node root = doc.getDocumentElement();
        NodeList nodes = root.getChildNodes();
        String count = getNodeValue("ResultCount", nodes);
        
        System.out.print(count + "\n");
        NodeList recipies = doc.getElementsByTagName("RecipeInfo");
        
        for (int temp = 0; temp < recipies.getLength(); temp++)
        {
           Node recipeInfo = recipies.item(temp);
           NodeList recipeInfoChildren = recipeInfo.getChildNodes();
           
           for (int i = 0; i < recipeInfoChildren.getLength(); i++) 
           {
              Node child = recipeInfoChildren.item(i);
              //This gets the Title
              if (child.getNodeName().equals("Title")) 
              {
                 System.out.println(child.getTextContent());
              }
              //This gets the RecipeID
              if (child.getNodeName().equals("RecipeID")) 
              {
                 System.out.println(child.getTextContent());
              }
              //This gets the URLs
              if (child.getNodeName().equals("WebURL")) 
              {
                 System.out.println(child.getTextContent());
              }
              if (child.getNodeName().equals("ImageURL")) 
              {
                 System.out.println(child.getTextContent());
              }
           }  
        }
     } catch (SAXException e)
     {
        // TODO Auto-generated catch block
        e.printStackTrace();
     } catch (Exception e)
     {
        // TODO Auto-generated catch block
        e.printStackTrace();
     }
      
   }
   
   public static Document loadXMLFromString(String xml) throws Exception
   {
       DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
       DocumentBuilder builder = factory.newDocumentBuilder();
       InputSource is = new InputSource(new StringReader(xml));
       return builder.parse(is);
   }
   
   private String getNodeValue(String tagName, NodeList nodes ) 
   {
      for ( int x = 0; x < nodes.getLength(); x++ ) 
      {
          Node node = nodes.item(x);
          if (node.getNodeName().equalsIgnoreCase(tagName)) 
          {
              NodeList childNodes = node.getChildNodes();
              for (int y = 0; y < childNodes.getLength(); y++ ) 
              {
                  Node data = childNodes.item(y);
                  if ( data.getNodeType() == Node.TEXT_NODE )
                      return data.getNodeValue();
              }
          }
      }
      return "";
  }
   @Override
   public boolean createScripture( Recipe newRecipe)
   {
      // TODO Auto-generated method stub
      return false;
   }
   @Override
   public Recipe getRecipe( int recipeId)
   {
      // TODO Auto-generated method stub
      return null;
   }
   @Override
   public List<Recipe> getAllRecipies()
   {
      List<Recipe> list = new ArrayList<Recipe>();
      try 
      {
         Class.forName("com.mysql.jdbc.Driver");
      
         Properties prop = new Properties();
         prop.load(getClass().getResourceAsStream("/scriptureDbAccess.properties"));

         String user = prop.getProperty("dbUser");
         String pass = prop.getProperty("dbPassword");

         Connection conn = DriverManager.getConnection(DB_CONNECTION, user, pass);
         Statement statement = conn.createStatement();

         String sql = "SELECT * FROM recipe";

         ResultSet resultSet = statement.executeQuery(sql);

         while (resultSet.next()) {
             String recipe_name = resultSet.getString("recipe_name");
             int recipe_BOID = resultSet.getInt("recipe_BOID");
             int recipe_list_list = resultSet.getInt("recipe_list_list");
             String recipe_url = resultSet.getString("recipe_url");
             String reciple_img = resultSet.getString("reciple_img");
             
             list.add(new Recipe());
         }

        } catch (ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return list; 
   }
   
}
