<?php
session_start();
if(isset($_SESSION['destination'])) {
	$destination = $_SESSION['destination'];
	$origin = $_SESSION['origin'];
	echo $destination.'<br>';
	echo $origin;
}
else {
	die( "Destination and origin are not set");
}
?>