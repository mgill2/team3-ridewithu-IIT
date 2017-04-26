<?php
session_start();
require_once('connectdatabase.php');
if(isset($_SESSION['destination']) && isset($_SESSION['origin'])) {
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

	$query= "SELECT * FROM listride";
	$result = mysqli_query($connection, $query); ?>

<!DOCTYPE html>
  <html lang="en" class="nojs">
  <head>
    <title>Illinois Tech Ride Share - Ride Request</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width,initial-scale=1.0,shrink-to-fit=no" />
    <link rel="stylesheet" href="css/normalize.css" />
    <link rel="stylesheet" href="css/screen.css" />
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/black-tie/jquery-ui.css" type="text/css">
    <script type="text/php" src="database.php"></script>
  </head>

  <body class="index">
    <header>
      <div class="banner">
        <a href="welcome.html">
          <img src="img/IITScarletHawks.png" alt="IIT Logo">
        </a>
        <img src="img/IITRideShare.png" alt="Ride Share Logo">
      </div>
      <nav>
      <div class="navwrapper">
          <ul id="nav" class="navbar">
            <li class="nav"><a href="welcome.html">Home</a></li>
            <li class="nav active"><a href="request.html">Request Ride</a></li>
            <li class="nav"><a href="ridelist.html">Ride List</a></li>
            <li class="nav"><a href="https://iit.edu/news/iittoday/">IIT News</a></li>
            <li class="nav"><a href="help.html">Help</a></li>
            <li class="nav"><a href="index.html">Logout</a></li>
          </ul>
        </div>
      </nav>
    </header>
    
   <div id="sidenavbar" class="sidenavbar">
      <ul id="nav" class="navbar">
        <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
        <li class="nav"><a href="welcome.html">Home</a></li>
        <li class="nav active"><a href="request.html">Request Ride</a></li>
        <li class="nav"><a href="ridelist.html">Ride List</a></li>
        <li class="nav"><a href="https://iit.edu/news/iittoday/">IIT News</a></li>
        <li class="nav"><a href="help.html">Help</a></li>
        <li class="nav"><a href="index.html">Logout</a></li>
      </ul>
    </div>

    <div id="mainnavbar">
      <span style="font-size:30px;cursor:pointer" onclick="openNav()">&#9776; </span>
    </div>
<?php }
else {
	die( "Destination and origin are not set");
}

?>