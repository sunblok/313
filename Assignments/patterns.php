<?php
   session_start();
   
   if(!isset($_SESSION))
   {
      $_SESSION["Submitted"] = "FALSE";
   }
   else
   {
      //This is for testing
      $_SESSION["Submitted"] = "FALSE";
   }
   if($_SESSION["Submitted"] == "TRUE")
   {
      /* Redirect browser */
      header("Location: results.php");
 
      /* Make sure that code below does not get executed when we redirect. */
      exit;
   }
   $key = "visits";
   $visits = 1;
   
   if (isset($_COOKIE[$key]))
   {
      //not first time
      $visits = $_COOKIE[$key] + 1;
      setcookie($key,$visits,time()+10); 
   }
   else
   {
      setcookie($key,$visits,time()+15); 
   }
  
?>
<?xml version = "1.0" encoding "utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN"
   "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">

<html xmlns = "http://www.w3.org/1999/xhtml">
   <head>
      <title> Redd's PHP Patterns</title>
      <link rel = "stylesheet" type = "text/css" href="/css/demo.css">
      
      
   </head>
   <body>
   <h1> Welcome to Ma's Patterns</h1>
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
            //This sorts by publisher
            echo "<table border = '1' > <th>Publisher</th><th>Type</th><th>Size</th><th>All</th>";
            echo"<tr><td><form action=\"resultPublisher.php\" method=\"post\">";
            $publisher = $mysqli->query("select distinct u.publisher_name, publisher_id from pattern as p join publisher as u on p.pattern_publisher = u.publisher_id ORDER BY publisher_name");
            echo "<select name = \"publisher\"> "; //onchange = \"handleChange(value) \">
            while ($row = $publisher->fetch_assoc())
            {
               echo "<option value = \"" . $row["publisher_id"] ."\"> " . $row["publisher_name"] . "</option>";
            }
            echo "</select><input type=\"submit\" value = \"Submit\"></form>";
            echo "<form action=\"resultPubAll.php\" method=\"post\">";
            
            echo "</select><input type=\"submit\" value = \"Show All by Publisher\"></form></td>";
            
            
            
           //This sorts by type 
            echo "<td><form action=\"resultType.php\" method=\"post\">";
            $type = $mysqli->query(" select distinct t.pType_name,t.pType_id from pType as t join type_Pattern as p where p.type_Pattern_pType = t.pType_id ORDER BY pType_name");
            echo "<select name = \"pType\"> "; //onchange = \"handleChange(value) \">
            while ($row = $type->fetch_assoc())
            {
               echo "<option value = \"" . $row["pType_id"] ."\"> " . $row["pType_name"] . "</option>";
            }
            echo "</select><input type=\"submit\" value = \"Submit\"></form>";
            echo "<form action=\"resultTypeAll.php\" method=\"post\">";
            
            echo "</select><input type=\"submit\" value = \"Show All by Type\"></form></td>";
            
            //This sorts by size 
            echo "<td><form action=\"resultSize.php\" method=\"post\">";
            $type = $mysqli->query("select distinct s.pSize_size, s.pSize_id from pSize as s join size_Pattern as p where p.size_Pattern_pSize = s.pSize_id ");
            echo "<select name = \"pSize\"> "; //onchange = \"handleChange(value) \">
            while ($row = $type->fetch_assoc())
            {
               echo "<option value = \"" . $row["pSize_id"] ."\"> " . $row["pSize_size"] . "</option>";
            }
            echo "</select><input type=\"submit\" value = \"Submit\"></form>";
            echo "<form action=\"resultSizeAll.php\" method=\"post\">";
            
            echo "</select><input type=\"submit\" value = \"Show All by Size\"></form></td>";
            
            
            //this shows all patterns
            echo "<td><form action=\"resultAll.php\" method=\"post\">";
            
            echo "</select><input type=\"submit\" value = \"Show all\"></form></td></tr></table>";
            
            
         }
         //Select *  from Note as n
         //join user as u on n.userid = u.id
         //where u.name = 'aaron'
         
         //select p.pattern_name, p.pattern_number, p.pattern_picture from pattern as p join
         //type_Pattern as t where type_Pattern_pattern = p.pattern_id and type_Pattern_pType = 1;
         
         ?> 
         <div name = "size" id = "size"></div>
         
   
   </body>
</html>