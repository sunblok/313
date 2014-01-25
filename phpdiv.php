<?xml version = "1.0" encoding "utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN"
   "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns = "http://www.w3.org/1999/xhtml">
   <head>
      <title> Redd's Test Page</title>
      <link rel = "stylesheet" type = "text/css" href="css/demo.css">
   </head>
      <body>
         
      <?php
         //printMsg("test");
         
         function printMsg($str)
         {
            print "$str <br />\n";
         }

      
         $str = "The cat in the hat";
         $words = explode(" ", $str );
         $done = implode( " ",$words);
         
         $list["happy"] = "George";
         $list[42] = "Tina";
         $list["Books"] = "Jim";
         $list["turgles"] = "Bob";
         foreach ($words as $key => $val)
            {
               echo "<div id = '$key' class = 'div$val'>$key:$val</div>";
            }
         echo $done;
         //printMsg("second");
      ?>
      </body>
</html>