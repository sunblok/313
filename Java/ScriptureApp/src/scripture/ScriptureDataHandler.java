package scripture;

import java.util.ArrayList;
import java.util.List;

public class ScriptureDataHandler
{
   
   List<Scripture> getScriptures()
   {
   
      List <Scripture> scripts = new ArrayList <Scripture>();
      scripts.add(new Scripture ("Proverbs", 3,5));
      scripts.add(new Scripture ("Amos", 3,7));
      scripts.add(new Scripture ("John", 7,17));
      scripts.add(new Scripture ("1 Nephi", 3,7));
      
      return scripts;
   }
}
