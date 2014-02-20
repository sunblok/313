<?xml version = "1.0" encoding "utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN"
   "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">

<html xmlns = "http://www.w3.org/1999/xhtml">
   <head>
      <title> Sign in</title>
      <link rel = "stylesheet" type = "text/css" href="/css/demo.css">
      <script src = "patterns.js" type = "text/javascript"></script>
      <script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
   </head>
   <body>
   
   <?php
      require_once('../Database/pass/pass.php');        
      $mysqli = new mysqli($host,$user ,$pass ,$base );
      if ($mysqli->connect_errno)
      {
         echo "Failed to connect to MySQL: " . $mysqli->connect_error;
      }
      else
      {
         $name = $_POST["name"];
         $pass = $_POST["password"];
         $owner = $mysqli->query("SELECT * FROM owner WHERE owner_user_name = '$name'");
         $goodPass = "";
         $ownerID = 0;
         
         while ($row = $owner->fetch_assoc())
         {
            $goodPass = $row["owner_password"];
            $ownerID = $row["owner_id"];
         }
         
         $inhash = hash("sha256", $pass);
         
         $outhash = hash("sha256", $goodPass);
         
         // echo $pass . "<>" . $goodPass. "<br/>";
         // echo $inhash . " <> ". $outhash;
         
         if($inhash == $outhash)
         {
            echo "</br>it worked!!";
         }
      }
   
   ?>
   
   
   
 </body>
</html>