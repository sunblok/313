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
&& ($_FILES["file"]["size"] < 1000000)
&& in_array($extension, $allowedExts))
  {
   if ($_FILES["file"]["error"] > 0)
   {
      $_SESSION["Responce"] = "Return Code: " . $_FILES["file"]["error"] . "<br>";
   }
   else
   {
      echo "Upload: " . $_FILES["file"]["name"] . "<br>";
      echo "Type: " . $_FILES["file"]["type"] . "<br>";
      echo "Size: " . ($_FILES["file"]["size"] / 1024) . " kB<br>";
      echo "Temp file: " . $_FILES["file"]["tmp_name"] . "<br>";

      if (file_exists("../Database/Pictures/" . $_FILES["file"]["name"]))
      {
         $_SESSION["Responce"] = $_FILES["file"]["name"]. "already exists. ";
      }
      else
      {
         move_uploaded_file($_FILES["file"]["tmp_name"],
         "../Database/Pictures/" . $_FILES["file"]["name"]);
         $_SESSION["Responce"] = "Stored as: " . $_FILES["file"]["name"];
      }
      $_SESSION["FILE"] = $_FILES["file"]["name"];
   }
  }
else
{
   
   $_SESSION["Responce"] = "Invalid file";
   header("Location: uploadPic.php");
   exit;
}
   header("Location: uploadPic.php");
?>