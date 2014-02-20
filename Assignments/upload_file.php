<?php
session_start();
echo "Adding file";

$allowedExts = array("gif", "jpeg", "jpg", "png");
$temp = explode(".", $_FILES["file"]["name"]);
$extension = end($temp);
if ((($_FILES["file"]["type"] == "image/gif")
|| ($_FILES["file"]["type"] == "image/jpeg")
|| ($_FILES["file"]["type"] == "image/jpg")
|| ($_FILES["file"]["type"] == "image/pjpeg")
|| ($_FILES["file"]["type"] == "image/x-png")
|| ($_FILES["file"]["type"] == "image/png"))
&& ($_FILES["file"]["size"] < 100000)
&& in_array($extension, $allowedExts))
  {
   if ($_FILES["file"]["error"] > 0)
   {
      echo "Return Code: " . $_FILES["file"]["error"] . "<br>";
      for ($i = 1; $i <16; $i = $i+1)
      {
         echo $i . " ";
         sleep(1);
      }
   }
   else
   {
      echo "Upload: " . $_FILES["file"]["name"] . "<br>";
      echo "Type: " . $_FILES["file"]["type"] . "<br>";
      echo "Size: " . ($_FILES["file"]["size"] / 1024) . " kB<br>";
      echo "Temp file: " . $_FILES["file"]["tmp_name"] . "<br>";

      if (file_exists("../Database/Pictures/" . $_FILES["file"]["name"]))
      {
         echo $_FILES["file"]["name"] . " already exists. ";
         for ($i = 1; $i <16; $i = $i+1)
      {
         echo $i . " ";
         sleep(1);
      }
      }
      else
      {
         move_uploaded_file($_FILES["file"]["tmp_name"],
         "upload/" . $_FILES["file"]["name"]);
         echo "Stored in: " . "Database/Pictures/" . $_FILES["file"]["name"];
         for ($i = 1; $i <16; $i = $i+1)
      {
         echo $i . " ";
         sleep(1);
      }
      }
   }
  }
else
{
   echo "Invalid file";
   for ($i = 1; $i <16; $i = $i+1)
   {
      echo $i . " ";
      sleep(1);
   }
   header("Location: uploadPic.php");
   exit;
}
   header("Location: confirmation.php");
?>