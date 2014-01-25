<?php
   session_start();
   if(!isset($_SESSION))
   {
      $_SESSION["Submitted"] = "FALSE";
   }
   else
   {
      //This is for testing
      //$_SESSION["Submitted"] = "FALSE";
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
      <title> Redd's Form</title>
      <link rel = "stylesheet" type = "text/css" href="/css/demo.css">
   </head>
   <body>
   <h1> Welcome to RedD's Form</h1>
      <hr />
      <?php
         require "../links.php";
      ?>
      <hr />
   <form action="results.php" method="post">
      <table border = "1">
         <tr><th> Major:</th><th> Which would you rather have?:</th><th> Places Visited:</th><th> What animals have you owned?:</th></tr>
         
         <tr>
            <td>
               <input type="radio" name="major" value="Computer Science">Computer Science<br/>
               <input type="radio" name="major" value="Web Development and Design">Web Development and Design<br/>
               <input type="radio" name="major" value="Computer Information Technology">Computer Information Technology<br/>
               <input type="radio" name="major" value="Computer Engineering">Computer Engineering<br/>
            </td>
            <td>
               <input type="radio" name="have" value="Pokeball"><img src ="http://static1.wikia.nocookie.net/__cb20130901024706/clubpenguin/images/thumb/4/4c/Pokeball.png/240px-Pokeball.png"
                          width = 100
                          height = 100 /><br/>
               <input type="radio" name="have" value="Lightsaber"><img src ="http://static.comicvine.com/uploads/scale_small/0/3133/140671-72233-lightsaber.jpg"
                          width = 100
                          height = 100 /><br/>
               <input type="radio" name="have" value="Phaser"><img src ="http://images.wikia.com/memoryalpha/de/images/2/29/Phaser_typ_2_2285.svg"
                          width = 100
                          height = 100 /><br/>
               <input type="radio" name="have" value="Tardis"><img src ="https://drupal.org/files/styles/grid-3/public/project-images/TARDIS2.png?itok=NU7rPQO7"
                          width = 100
                          height = 100 /><br/>
            </td>
            <td>
               <input type="checkbox" name="visited1" value="North America">North America<br/>
               <input type="checkbox" name="visited2" value="South America">South America<br/>
               <input type="checkbox" name="visited3" value="Europe">Europe<br/>
               <input type="checkbox" name="visited4" value="Asia">Asia<br/>
               <input type="checkbox" name="visited5" value="Australia">Australia<br/>
               <input type="checkbox" name="visited6" value="Africa">Africa<br/>
               <input type="checkbox" name="visited7" value="Antartica">Antartica<br/>
            </td>
            <td>
               <input type="checkbox" name="animals1" value="Dog">Dog<br/>
               <input type="checkbox" name="animals2" value="Cat">Cat<br/>
               <input type="checkbox" name="animals3" value="Bird">Bird<br/>
               <input type="checkbox" name="animals4" value="Fish">Fish<br/>
               <input type="checkbox" name="animals5" value="Sibling">Sibling<br/>
            </td>
         </tr>
      </table>
      <input type="radio" name="Summited" value="TRUE" class = "hidden" checked disabled><br/>
      
      <input type="submit" value = "Submit">
   </form>
   <form method = "LINK" Action = "results.php">
      <input type="submit" value = "See Results">
   </form>
   </body>
</html>