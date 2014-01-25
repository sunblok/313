<?xml version = "1.0" encoding "utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN"
   "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns = "http://www.w3.org/1999/xhtml">
   <head>
      <title> Redd's Form Page</title>
   </head>
   <body>
   
   <form action="welcome.php" method="post">
      Name: <input type="text" name="name"><br>
      E-mail: <input type="text" name="email"><br>
      
      Major: <br/>
      <input type="radio" name="major" value="Computer Science">Computer Science<br/>
      <input type="radio" name="major" value="Web Development and Design">Web Development and Design<br/>
      <input type="radio" name="major" value="Computer Information Technology">Computer Information Technology<br/>
      <input type="radio" name="major" value="Computer Engineering">Computer Engineering<br/>
      
      Places Visited:<br/>
      <input type="checkbox" name="visited[]" value="North America">North America<br/>
      <input type="checkbox" name="visited[]" value="South America">South America<br/>
      <input type="checkbox" name="visited[]" value="Europe">Europe<br/>
      <input type="checkbox" name="visited[]" value="Asia">Asia<br/>
      <input type="checkbox" name="visited[]" value="Australia">Australia<br/>
      <input type="checkbox" name="visited[]" value="Africa">Africa<br/>
      <input type="checkbox" name="visited[]" value="Antartica">Antartica<br/>
      
      Comments
      <textarea name="comments" /> </textarea><br/>
      
      <input type="submit" value = "submit">
      
      
   </form>
   </body>
</html>