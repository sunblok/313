<?php
   session_start();
   require_once('../Database/pass/pass.php');        
   $mysqli = new mysqli($host,$user ,$pass ,$base);
   $name = $_POST["name"];
   $pass = $_POST["password"];
   
   if ($mysqli->connect_errno)
   {
      echo "Failed to connect to MySQL: " . $mysqli->connect_error;
   }
   else
   {
      if ($_SESSION["Signedin"] != "TRUE")
      {
         $owner = $mysqli->query("SELECT * FROM owner WHERE owner_user_name = '$name'");
         $goodPass = "";
         $ownerID = 0;
         
         while ($row = $owner->fetch_assoc())
         {
            $goodPass = $row["owner_password"];
            $ownerID = $row["owner_id"];
         }
         
         $inhash = hash("sha256", $pass);
         
         //echo $inhash . "><" . $goodPass;
         if($inhash != $goodPass)
         { 
            //header("Location: Signin.php");
            exit;
         }
      }
      $_SESSION["Signedin"] = "TRUE";
      $_SESSION["Owner"] = $ownerID;
   }
?>
<?xml version = "1.0" encoding "utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN"
   "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">

<html xmlns = "http://www.w3.org/1999/xhtml">
   <head>
      <title> Insert into the Database</title>
      <link rel = "stylesheet" type = "text/css" href="/css/demo.css">
      <script src = "patterns.js" type = "text/javascript"></script>
      <script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
   </head>
   <body>
   <h1> Insert into the Database </h1> 
      <hr />
      <?php
         require "../links.php";
      ?>
      <hr />
      <?php
         require('../Database/pass/pass.php');        
         $mysqli = new mysqli($host,$user ,$pass ,$base );
         
         if ($mysqli->connect_errno)
         {
            echo "Failed to connect to MySQL: " . $mysqli->connect_error;
         }
         else
         {  
            echo "<form action='uploadPic.php' method='post' id = 'submit'><table border = '1' ><tr><th>Owner</th><th>Pattern</th><th>Publisher</th><th>Type</th><th>Size</th>";
            echo"</tr><tr><td>";
            //Owner
            echo "<input type='radio' name='info' value='1' class = 'hidden' checked><br/>";
            $owner = $mysqli->query("SELECT * FROM owner");
            while ($row = $owner->fetch_assoc())
            {
               if ($row["owner_name"] != "Root")
               {
                  echo  "<input type= 'checkbox' name='owner[]' value='".$row["owner_id"]."'>".$row["owner_name"]."</br>";
               }
            }
            
            echo "</td><td>";
            //Pattern
            echo "Name:<input type='text' name='name'><br/>";
            echo "Number:<input type='text' name='number'><br/>";
            
            echo "</td><td>";
            //Publisher
            $publisher = $mysqli->query("SELECT * FROM publisher ORDER BY publisher_name");
            while ($row = $publisher->fetch_assoc())
            {
               echo  "<input type= 'radio' name='publisher' value='".$row["publisher_id"]."'>".$row["publisher_name"]."</br>";
              
            }
            //Type
            echo "</td><td>";
            $type = $mysqli->query("SELECT * FROM pType ORDER BY pType_name");
            while ($row = $type->fetch_assoc())
            {
               echo  "<input type= 'checkbox' name='type[]' value='".$row["pType_id"]."'>".$row["pType_name"]."</br>";
            }
           /*  //Picture
            echo "</td><td>";
            //echo "<button onclick='location.href='uploadPic.php''>www.example.com</button>";
            echo "<input type='button' disabled = 'true' name='uploadPictures' value='Upload Picture'></br>";
               
            //gets the pictures you can upload.
            echo "<div id = 'dir'>";
            require_once('dir.php');
            echo "</div>"; */
            //Size
            echo "</td><td>";
            $size = $mysqli->query("SELECT * FROM pSize");
            while ($row = $size->fetch_assoc())
            {
               echo  "<input type= 'checkbox' name='size[]' value='".$row["pSize_id"]."'>".$row["pSize_size"]."</br>";
            }
            echo "</td></tr></table><input type='submit' name='submit' form = 'submit' value='Next'></form>";
         }
      ?>
   </body>
</html>