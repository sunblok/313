<?php
   session_start();
?>
<?xml version = "1.0" encoding "utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN"
   "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns = "http://www.w3.org/1999/xhtml">
   <head>
      <title> Ma's Patterns</title>
      <link rel = "stylesheet" type = "text/css" href="/css/demo.css">
   </head>
      <body>
         <h1> Ma's Patterns Types </h1>
         <hr />
         <?php
            require "../links.php";
         ?>
         <hr />
         <?php
            require_once('../Database/pass/pass.php');        
            $mysqli = new mysqli($host,$user ,$pass ,$base );
            
            if ($mysqli->connect_errno)
            {
               echo "Failed to connect to MySQL: " . $mysqli->connect_error;
            }
            else
            {  
               $type = $mysqli->query("select pType_name from pType where pType_id =" . $_POST["pType"]);
               while ($row = $type->fetch_assoc())
               {
                  echo  "<h3>".$row["pType_name"] . "</h3>";
               }
               
               $count = 0;
               echo "<table border = '1'><tr>";
               $pattern = $mysqli->query("select p.pattern_name, p.pattern_number, p.pattern_picture, u.publisher_name from pattern as p join type_Pattern as t JOIN publisher as u WHERE t.type_Pattern_pattern = p.pattern_id AND u.publisher_id = p.pattern_publisher AND t.type_Pattern_pType =" . $_POST["pType"]);
               while ($row = $pattern->fetch_assoc())
               {
                  echo  "<td>".$row["pattern_name"] ."</br>". $row["publisher_name"] ."</br>". $row["pattern_number"] 
                  ."</br><img src = \"../" . $row["pattern_picture"]."\" alt = \"" . $row["pattern_number"]. " \" height = \"200\" width = \"150\" > </td>";
                  $count = $count +1;
                  if ($count == 5)
                  {
                     echo "</tr><tr>";
                     $count = 0;
                  }
               }
               echo "</tr></table>";
            }
         ?>
         <form method = "LINK" Action = "patterns.php">
            <input type="submit" value = "Back">
         </form>
      </body>
</html>