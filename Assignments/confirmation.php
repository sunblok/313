<?php
   session_start();
   // if($_SESSION["Signedin"] != "TRUE")
   // {
      // header("Location: Signin.php");
      // exit;
   // }
?>
<?xml version = "1.0" encoding "utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN"
   "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">

<html xmlns = "http://www.w3.org/1999/xhtml">
   <head>
      <title> Insert Confirmation into the Database</title>
      <link rel = "stylesheet" type = "text/css" href="/css/demo.css">
      <script src = "patterns.js" type = "text/javascript"></script>
      <script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
   </head>
   <body>
   <h1> Insert Confirmation into the Database </h1>
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
            // if (!isset($_SESSION))
            // {
               // $_SESSION["DONE"] = "FALSE";
            // }
            
            if ($_POST)//AND $_SESSION["DONE"] != "TRUE")
            {
               $owner = $_POST["owner"];
               $name = $_POST["name"];
               $number = $_POST["number"];
               $publisher = $_POST["publisher"];
               $type = $_POST["type"];
               $picture = $_POST["picture"];
               $size = $_POST["size"];
               
               $ownerId = 0;//$_SESSION["Owner"];
               
               
               //This sets up a log of all the database accesses
               $file = fopen("../Database/texts/dataLog_from_patterns.txt","a+") or die;
               $time = getdate();
               $time = $time["hours"] . ":" .$time["minutes"] . ":" .$time["seconds"] . ";;". $time["month"] . "-"  . $time["mday"] . "-". $time["year"];
               //Insert into Pattern
               $query = "INSERT INTO pattern( pattern_name, pattern_number, pattern_picture, pattern_publisher, pattern_date_created)
                           VALUES
                           ('$name', '$number', 'Database/Pictures/$picture', $publisher,UTC_DATE())";
               $mysqli->query($query);
               
               
               //Writes log
               $query = $time . " () ".$ownerId ." ". $query . PHP_EOL;
               fwrite($file,$query);
               // $warnings = $mysqli->warning_count();
               // echo "<h3>Pattern Warnings = </h3>".$warnings."</br>";
               
               //Finds the newly inserted pattern
               $pattern = $mysqli->query("SELECT * FROM pattern WHERE pattern_number = '$number'");
               $thepattern = 1;
               while ($row = $pattern->fetch_assoc())
               {
                  //echo $row["pattern_id"];
                  $thepattern = $row["pattern_id"];
               }
                
               //Inserts into type_Pattern
               foreach ($type as $test)
               {
                  $query ="INSERT INTO type_Pattern( type_Pattern_pType, type_Pattern_pattern)
                              VALUES
                              ($test, $thepattern)";
                  $mysqli->query($query);
                  // $warnings = $mysqli->warning_count();
                  // echo "<h3>Type Warnings = </h3>".$warnings."</br>";
                  
                  //Writes log
                  $query = $time . " () ".$ownerId ." ". $query . PHP_EOL;
                  fwrite($file,$query) ."</br>";
               }
               
               //Inserts into size_Pattern
               foreach ($size as $test)
               {
                  $query = "INSERT INTO size_Pattern( size_Pattern_pSize, size_Pattern_pattern)
                              VALUES
                              ($test, $thepattern)";
                  $mysqli->query($query);
                  // $warnings = $mysqli->warning_count();
                  // echo "<h3>Size Warnings = </h3>".$warnings."</br>";
                  //Writes log
                  $query = $time . " () ".$ownerId ." ". $query . PHP_EOL;
                  fwrite($file,$query);
               }
               //Inserts into owner_Pattern
               foreach ($owner as $test)
               {
                  $query = "INSERT INTO owner_Pattern( owner_Pattern_owner, owner_Pattern_pattern)
                              VALUES
                              ($test, $thepattern)";
                  $mysqli->query($query);
                  // $warnings = $mysqli->warning_count();
                  // echo "<h3>owner Warnings = </h3>".$warnings."</br>";
                  //Writes log
                  $query = $time . " () ".$ownerId ." ". $query . PHP_EOL;
                  fwrite($file,$query);
               }
                
               $mysqli->commit();
               $mysqli->close();
               
               echo "You have successfully inserted into the database.";
               
               //$_SESSION["DONE"] = "TRUE";
            }
            else
            {
               echo "That wasn't right.";
            }
            echo "<form method = 'LINK' Action = 'insert.php'>
               <input type='submit' value = 'Back'>
               </form>";
         }
      ?>
      
   </body>
</html>