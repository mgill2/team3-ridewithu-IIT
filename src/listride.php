<?php
session_start();
if(isset($_SESSION['destination'])) {
	$destination = $_SESSION['destination'];
	$origin = $_SESSION['origin'];
	$leaving_date = $_SESSION['leaving_date'];
	$leaving_hour = $_SESSION['leaving_hour'];
	$leaving_minutes = $_SESSION['leaving_minutes'];
	$leaving_clock = $_SESSION['leaving_clock'];
	echo $destination.'<br>';
	echo $origin.'<br>';
	echo $leaving_date.'<br>';
	echo $leaving_hour.'<br>';
	echo $leaving_minutes.'<br>';
	echo $leaving_clock;
}
else {
	die( "Destination and origin are not set");
}

?>