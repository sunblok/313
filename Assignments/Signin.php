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
   <h1> Sign in </h1>
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
            echo "<form action='insert.php' method='post' id = 'submit'>";
            echo "Username:<input type='text' name='name'><br/>Password:<input type='password' name='password'><br/>";
            echo "<input type='submit' name='submit' form = 'submit' value='Submit'></form>";
         }
      ?>
   </body>
</html>