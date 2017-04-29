<?php
session_start();
    require_once('connectdatabase.php');
	$origin_address= " ";
	$destination_address= " ";
	$origin_address = $_POST['origin_address'];
	$destination_address = $_POST['destination_address'];
	$leaving_date = $_POST['leaving_date'];
	$leaving_hour = $_POST['leaving_hour'];
	$leaving_minutes = $_POST['leaving_minutes'];
	$leaving_clock = $_POST['leaving_clock'];
	$name = $_SESSION['name'];
	$email = $_SESSION['email'];
	//echo $origin_address;
	//echo $destination_address;
	//echo $leaving_date;
	//echo $leaving_hour;
	//echo $leaving_minutes;
	/echo $leaving_clock;

	$origin_address = mysqli_real_escape_string($connection, $origin_address);
	$destination_address = mysqli_real_escape_string($connection, $destination_address);
	$leaving_date = mysqli_real_escape_string($connection, $leaving_date);
	$leaving_time = $leaving_hour . ':' . $leaving_minutes . ' ' . $leaving_clock;
	$leaving_time = mysqli_real_escape_string($connection, $leaving_time);
	$name_user = mysqli_real_escape_string($connection, $name);
	$email_user = mysqli_real_escape_string($connection, $email);
	$query = "INSERT INTO listride (ID, NAME, EMAIL, ORIGIN, DESTINATION, LEAVING_DATE, LEAVING_TIME) VALUES (0, '$name_user', '$email_user', '$origin_address','$destination_address','$leaving_date','$leaving_time')";
	$result = mysqli_query($connection, $query);
	if ($result == true) {
		//echo '<script>console.log("Data inserted")</script>';
	}
	$_SESSION['destination'] = $destination_address;
	$_SESSION['origin'] = $origin_address;
	$_SESSION['leaving_date'] = $leaving_date;
	$_SESSION['leaving_hour'] = $leaving_hour;
	$_SESSION['leaving_minutes'] = $leaving_minutes;
	$_SESSION['leaving_clock'] = $leaving_clock;


?>