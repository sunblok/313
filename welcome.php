<?xml version = "1.0" encoding "utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN"
   "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns = "http://www.w3.org/1999/xhtml">
   <head>
      <title> Redd's Welcome Page</title>
   </head>
   <body>
   
   
   
   Welcome 
   <?php 
      $name = htmlspecialchars($_POST["name"]);
      echo $name; 
   ?> </br>
   </br>Email: 
   <?php 
      $email = htmlspecialchars($_POST["email"]);
      echo "<a href='mailto:{$email}' >{$email}</a>"; 
   
   ?> 
  
   </br>Major: <?php echo $_POST["major"]; ?> 
   
   </br> Places Visited: 
   <ul><?php 
   foreach ($_POST["visited"] as $value)
   {
      echo "<li> $value</li>";
   } 
   ?> 
   </ul>
   </br></br> Comments: <?php echo $_POST["comments"]; ?> 
   
   </body>
</html>