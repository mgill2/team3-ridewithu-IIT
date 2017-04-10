<?php

// Load the settings from the central config file
require_once 'includes/CAS/config.php';

// Load the CAS lib
require_once 'includes/CAS.php';

// Initialize phpCAS
phpCAS::client(CAS_VERSION_2_0, $cas_host, $cas_port, $cas_context);

// For production use set the CA certificate that is the issuer of the cert
// on the CAS server and uncomment the line below
phpCAS::setCasServerCACert($cas_server_ca_cert_path);

// force CAS authentication
phpCAS::forceAuthentication();

// at this step, the user has been authenticated by the CAS server
// and the user's login name can be read with phpCAS::getUser().

// for this test, simply print that the authentication was successfull
?>

<!DOCTYPE html>
<html lang="en" class="nojs">
<head>
  	<title>Illinois Tech Ride Share - Welcome</title>
  	<meta charset="utf-8" />
  	<meta name="viewport" content="width=device-width,initial-scale=1.0,shrink-to-fit=no" />
  	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/4.1.1/normalize.min.css" />
  	<link rel="stylesheet" href="css/screen.css" />
  	<script type="text/php" src="database.php"></script>
</head>

<body class="index">
	<header>
      <div class="banner">
        <a href="welcome.html">
          <img src="img/IITScarletHawks.png" alt="IIT Logo">
        </a>
      </div>
      <!-- <nav>
      <div class="navwrapper">
          <ul id="nav" class="navbar">
            <li class="nav active"><a href="welcome.html">Home</a></li>
            <li class="nav"><a href="request.html">Request Ride</a></li>
            <li class="nav"><a href="listride.html">List Ride</a></li>
            <li class="nav"><a href="https://iit.edu/news/iittoday/">IIT News</a></li>
            <li class="nav"><a href="redirect.html">Help</a></li>
            <li class="nav"><a href="index.html">Logout</a></li>
          </ul>
        </div>
      </nav> -->
    </header>
    
    <div id="sidenavbar" class="sidenavbar">
      <ul id="nav" class="navbar">
        <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
        <li class="nav active"><a href="welcome.html">Home</a></li>
        <li class="nav"><a href="request.html">Request Ride</a></li>
        <li class="nav"><a href="listride.html">List Ride</a></li>
        <li class="nav"><a href="https://iit.edu/news/iittoday/">IIT News</a></li>
        <li class="nav"><a href="redirect.html">Help</a></li>
        <li class="nav"><a href="index.html">Logout</a></li>
      </ul>
    </div>

    <div id="mainnavbar">
        <span style="font-size:30px;cursor:pointer" onclick="openNav()">&#9776; open</span>
    </div>
    <main>
      <section class="greeting">
        Welcome, User!
      </section>
      <section class="news">
      <article>
          <header>
            <h3>IIT Events</h3>
          </header>
          <a href="http://web.iit.edu/university-calendar">View the University Calendar Here</a>
          <div class="calendar">
            <iframe src="https://www.google.com/calendar/embed?src=calendar%40iit.edu&amp;ctz=America/Chicago" frameborder="0" scrolling="no"></iframe>
          </div>
        </article>
	  <article>
          <header>
            <h3>Public Safety</h3>
          </header>
          <h4>Emergency Phone Numbers</h4>
          	  <p><strong>Main Campus</strong>: 312.808.6363</p>
    		  <p><strong>Downtown Campus</strong>: 312.906.5030</p>
    		  <p><strong>Moffett Campus</strong>: 708.563.8280</p>
    		  <p><strong>Rice Campus</strong>: 630.682.6054</p>
        </article>
      </section>
    </main>
  <ul>
    <?php if($uploadOn==1) : ?>
      <li><a href="getride.php">Get Ride</a></li>
    <?php endif; ?>
  </ul>

  <div id="map"> </div>

    <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
    <script type="text/javascript" src="js/site.js"></script>
    <!-- <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBhj5z1Bj0Nl7LPPiEzjEdECnUeOoXJI6w&callback=initMap"></script> 
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script> -->
    <script async defer
      src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBhj5z1Bj0Nl7LPPiEzjEdECnUeOoXJI6w&callback=initMap">
    </script>
    
  
  
</body>
  
</html>