<?php
//conection: 
$link = mysqli_connect("192.168.1.208","team3rocks","jeremytheboss","backend") or die("Error " . mysqli_error($link)); 
echo "Here is the result: " . $link;
 /*$sql = "CREATE TABLE comments 
(
ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
PosterName VARCHAR(32),
Title VARCHAR(32),
Content VARCHAR(500)
)";
$con->query($sql); */
?>