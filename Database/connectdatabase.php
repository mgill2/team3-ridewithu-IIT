<?php
include_once 'config_database.php'; //Calling all the variables saved in this file
$connection = mysqli_connect(HOST, USER, PASSWORD);
if(!$connection) {
	die("Database connection failed" . mysqli_error($connection));
}
$select_db = mysqli_select_db($connection, DATABSE);
if(!$select_db) {
	die("Database selection failed" . mysqli_error($select_db));
}
?>
