<?php
session_start();
if (!isset($_SESSION['username'])) {
    header("Location: index.php");
}
else {
  $name = $_SESSION['name'];
  //echo "<script>console.log('$first_name');</script>";
}
?>

<!DOCTYPE html>
<html lang="en" class="nojs">
<head>
    <title>Illinois Tech Ride Share - Welcome</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width,initial-scale=1.0,shrink-to-fit=no" />
    <link rel="stylesheet" href="css/normalize.css" />
    <link rel="stylesheet" href="css/screen.css" />
</head>

<body class="index">
  <header>
      <div class="banner">
        <a href="welcome.php">
          <img src="img/IITScarletHawks.png" alt="IIT Logo">
        </a>
        <img src="img/IITRideShare.png" alt="Ride Share Logo">
      </div>
      <nav>
      <div class="navwrapper">
          <ul id="nav" class="navbar">
            <li class="nav active"><a href="welcome.php">Home</a></li>
            <li class="nav"><a href="request.html">Request Ride</a></li>
            <li class="nav"><a href="ridelist.php">Ride List</a></li>
            <li class="nav"><a href="https://iit.edu/news/iittoday/">IIT News</a></li>
            <li class="nav"><a href="help.html">Help</a></li>
            <li class="nav"><a href="index.php">Logout</a></li>
          </ul>
        </div>
      </nav>
    </header>
    
    <div id="sidenavbar" class="sidenavbar">
      <ul id="nav" class="navbar">
        <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
        <li class="nav active"><a href="welcome.php">Home</a></li>
        <li class="nav"><a href="request.html">Request Ride</a></li>
        <li class="nav"><a href="ridelist.php">Ride List</a></li>
        <li class="nav"><a href="https://iit.edu/news/iittoday/">IIT News</a></li>
        <li class="nav"><a href="help.html">Help</a></li>
        <li class="nav"><a href="index.php">Logout</a></li>
      </ul>
    </div>

    <div id="mainnavbar">
        <span style="font-size:30px;cursor:pointer" onclick="openNav()">&#9776; </span>
    </div>
    <main>
      <section class="greeting">
        Welcome, <?php echo $name ?>!
      </section>
      
      <p1> IIT's Ride Share application is intended to be used by students and staff ONLY. No other riders outside of the school are permitted.</p1>
      
      <p1>
      <div id="map"> </div>
      
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
    

    <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
    <script type="text/javascript" src="js/site.js"></script>
   <!-- <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBhj5z1Bj0Nl7LPPiEzjEdECnUeOoXJI6w&callback=initMap"></script> -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBhj5z1Bj0Nl7LPPiEzjEdECnUeOoXJI6w&callback=initMap" async defer>
    </script>
    
</body>
  
</html>