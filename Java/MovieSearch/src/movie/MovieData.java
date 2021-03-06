package movie;
import java.io.IOException;
import java.net.URL;
import java.util.Map;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
public class MovieData
{
   private String title;// :"Star Wars: Episode IV - A New Hope"
   private int year; //,"Year":"1977"
   private String rating ; //,"Rated":"PG"
   private String imdbID; //,"imdbID":"tt0076759"
      //,"Released":"25 May 1977"
      //,"Runtime":"121 min"
      //,"Genre":"Action, Adventure, Fantasy"
      //,"Director":"George Lucas"
      //,"Writer":"George Lucas"
//      ,"Actors":"Mark Hamill, Harrison Ford, Carrie Fisher, Peter Cushing"
//      ,"Plot":"Luke Skywalker joins forces with a Jedi Knight, a cocky pilot, a wookiee and two droids to save the universe from the Empire's world-destroying battle-station, while also attempting to rescue Princess Leia from the evil Darth Vader."
//      ,"Language":"English"
//      ,"Country":"USA"
//      ,"Awards":"Won 6 Oscars. Another 35 wins & 26 nominations."
//      ,"Poster":"http://ia.media-imdb.com/images/M/MV5BMTU4NTczODkwM15BMl5BanBnXkFtZTcwMzEyMTIyMw@@._V1_SX300.jpg"
//      ,"Metascore":"91"
//      ,"imdbRating":"8.8"
//      ,"imdbVotes":"625,633"
   //,"Type":"movie"
   //,"Response":"True"}
  
   public MovieData()
   {
      title = "";
      year = 0;
      rating = "";
      imdbID = "";
   }
   
   public MovieData(String title, int year, String rating, String ID)
   {
      this.title = title;
      this.year = year;
      this.rating = rating;
      this.imdbID = ID;       
   }
   
   
   public String getTitle()
   {
      return title;
   }
   public void setTitle( String title)
   {
      this.title = title;
   }
   public int getYear()
   {
      return year;
   }
   public void setYear( int year)
   {
      this.year = year;
   }
   public String getRating()
   {
      return rating;
   }
   public void setRating( String rating)
   {
      this.rating = rating;
   }
   public String getImdbID()
   {
      return imdbID;
   }
   public void setImdbID( String imdbID)
   {
      this.imdbID = imdbID;
   }

   
   public void testData(String json)throws JsonParseException,JsonMappingException,IOException
   {
      URL url = new URL("http://www.omdbapi.com/?s=Park");
      
      ObjectMapper mapper = new ObjectMapper();
      Map<String,Object> map = mapper.readValue(url, Map.class);
   
      for (String key : map.keySet())
      {
         System.out.println(key+":" + map.get(key));
      }
   }
  
   public void setData(String json)throws JsonParseException,JsonMappingException,IOException
   {
      URL url = new URL("http://www.omdbapi.com/?s=Park");
      
      ObjectMapper mapper = new ObjectMapper();
      Map<String,Object> map = mapper.readValue(url, Map.class);
   
      for (String key : map.keySet())
      {
         System.out.println(key+":" + map.get(key));
      }
   }
}

