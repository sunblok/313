<?php
   $dir = "../Database/Pictures/";
   $pictures =(scandir($dir));
   
   foreach ($pictures as $txt)
   {
      if ($txt != ".." and $txt != ".")
      {
         echo "<input type= 'radio' name='picture' value='$txt'>$txt</br>";
      }
   }
?>