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
               
               $pattern = $mysqli->query("SELECT * FROM pattern AS p JOIN type_Pattern AS t JOIN pType AS y JOIN publisher as b WHERE b.publisher_id = p.pattern_publisher AND p.pattern_id = t.type_Pattern_pattern AND t.type_Pattern_pType = y.pType_id ORDER BY pType_name");
                  echo  "<h3>All by Type</h3>";
               $count = 0;
               echo "<table border = '1'><tr>";
               $type = -1;
               while ($row = $pattern->fetch_assoc())
               {
                  if ($type != $row["type_Pattern_pType"])
                  {
                     echo "<tr><td><h3>". $row["pType_name"]."</h3></td>";
                     $type = $row["type_Pattern_pType"]; 
                     $count = 0;
                  }
                  echo  "<td>".$row["pattern_name"] ."</br>". $row["publisher_name"] ."</br>". $row["pattern_number"] 
                  ."</br><img src = \"../" . $row["pattern_picture"]."\" alt = \"" . $row["pattern_number"]. " \" height = \"200\" width = \"150\" > </td>";
                  $count = $count + 1;
                  if ($count == 6)
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