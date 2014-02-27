<?php
   session_start();
?>
<?xml version = "1.0" encoding "utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN"
   "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns = "http://www.w3.org/1999/xhtml">
   <head>
      <title> Redd's Survey Results</title>
      <link rel = "stylesheet" type = "text/css" href="/css/demo.css">
   </head>
      <body>
         <h1> Welcome to RedD's Survey Results </h1>
         <hr />
         <?php
            require "../links.php";
         ?>
         <hr />
         <?php
            $items = array();
            $fileName = "data.txt";
            $lines = file($fileName);
            
            //This checks if there was anything read in.
            if ($lines)
            {
               //This separates each line               
               $stat = explode(";",$lines[0]);
               foreach($stat as $pair)
               {
                  $test = explode(":",$pair);
                  $items[$test[0]] = $test[1];
               }
               
               
               //Opens the file for writing
               $file=fopen($fileName,"w");
               echo "<table border = '1'><tr><th>Name</th><th>Amount</th><th>Change</th></tr><tr>";
               //This prints out the information
               foreach ($items as $name=>$amount)
               {
                  $change = 0;
                  //This only happens if the session was posted
                  if($_POST and $_SESSION["Submitted"] == "FALSE")
                  {
                     //echo "here";
                     foreach($_POST as $val)
                     {
                        if($val == $name)
                        {
                           $change = 1;
                           $amount = $amount +1;
                        }
                        else
                        {
                           //This is to make sure amount is a number
                           $amount = $amount +1;
                           $amount = $amount -1;
                        }
                     }
                  }
                  //Writes to the file
                  if($name != "")
                  {
                     fwrite($file,"$name:$amount;");
                     echo "<tr><td>",$name, "</td><td";
                     if($change)
                     {
                        echo " class = 'up'";
                     }
                     echo ">",$amount,"</td><td";
                     if($change)
                     {
                        echo " class = 'up'";
                     }
                     echo ">",$change,"</td></tr>";  
                  }
                  
               }
               echo "</table>";
               //This makes sure you can't refresh and skew the numbers
               if ($_POST and $_SESSION["Submitted"] == "FALSE")
               {
                  $_SESSION["Submitted"] = "TRUE";
                  //echo "testsed";
               }
            }
         
         ?>
         <form method = "LINK" Action = "form.php">
            <input type="submit" value = "Back">
         </form>
      </body>
</html>