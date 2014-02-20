<?php
   $date = getdate();
   //print_r($date);
   $hours = $date["hours"];
   $minutes = $date["minutes"];
   $seconds = $date["seconds"];
   
   echo  $hours . ":" . $minutes. ":" . $seconds;
?>