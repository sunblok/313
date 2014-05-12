import java.beans.Statement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;


public class jdbcScritpureDAO implements ScriptureDAO
{

   @Override
   public boolean createScripture( scripture newScripture)
   {
      // TODO Auto-generated method stub
      return false;
   }

   @Override
   public scripture getScritpure( int scritpureId)
   {
      // TODO Auto-generated method stub
      return null;
   }

   private final String DB_CONNECT = "jdbc:mysql://localhost/scriptures";
   private final String DB_USER= "root";
   private final String DB_PASS= "RedD313ServesYou";
   @Override
   public List<scripture> getAllScritpures()
   {
      List <scripture> list= new ArrayList<scripture>();
      
      try
      {
         Class.forName("com.mysql.jdbc.Driver");
         
         Properties prop = new Properties();
         //prop.load(getClass().getResourceAsStream("scriputreDbAccess.properties));
         
         Connection conn = DriverManager.getConnection(DB_CONNECT, DB_USER, DB_PASS);
         
         String sql = "SELECT * FROM scripture";
         //ResultSet resultSet = statement.executeQuery(sql);
      } catch (ClassNotFoundException e)
      {
         // TODO Auto-generated catch block
         e.printStackTrace();
      } catch (SQLException e)
      {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }
      
      return list;
   }

}
