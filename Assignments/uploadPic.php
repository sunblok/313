<?php
   session_start();
   require_once('../Database/pass/pass.php');       
   //echo "THis is it!";
   //echo $_POST["info"] . $_POST["owner"];
   if ($_POST["info"])
   {
      $_SESSION["owner"] = $_POST["owner"];
      $_SESSION["name"] = $_POST["name"];
      $_SESSION["number"] = $_POST["number"];
      $_SESSION["publisher"] = $_POST["publisher"];
      $_SESSION["type"] = $_POST["type"];
      $_SESSION["size"] = $_POST["size"];
      echo "I DID IT!!!!";
   }
   //echo $inhash . "><" . $goodPass;
   if($_SESSION["Signedin"] != "TRUE")
   {
      header("Location: Signin.php");
      exit;
   }
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
   <h2> Select the picture or if you don't see it upload it.</h2>
   
   <form action="confirmation.php" method="post">
   <?php
      echo $_SESSION["Responce"]. "";
      require "dir.php";
   ?><br>
   <input type="submit" name="submit" value="Submit to Database">
   </form><br><br>
   
   <form action="upload_file.php" method="post"
   enctype="multipart/form-data">
   <label for="file">Filename:</label>
   <input type="file" name="file" id="file"><br>
   <input type="submit" name="submit" value="Upload">
   </form>

</body>
</html>