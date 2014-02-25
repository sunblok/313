<?php
   $dir = "../Database/Pictures/";
   $pictures =(scandir($dir));
   
   foreach ($pictures as $txt)
   {
      if ($txt != ".." and $txt != ".")
      {
         echo "<div ";
         if ($_SESSION["FILE"] == $txt)
         {
            echo "class = 'up'";
         }
         echo "><input type= 'radio' name='picture' value='$txt'>$txt</br></div>";
      }
   }
?>