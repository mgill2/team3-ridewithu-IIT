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



// storing password hash
// $random_chars retrieved e.g. using /dev/random
$query  = sprintf("INSERT INTO users(name,pwd) VALUES('%s','%s');",
            pg_escape_string($username),
            pg_escape_string(crypt($password, '$2a$07$' . $random_chars . '$')));
$result = pg_query($connection, $query);

// querying if user submitted the right password
$query = sprintf("SELECT pwd FROM users WHERE name='%s';",
            pg_escape_string($username));
$row = pg_fetch_assoc(pg_query($connection, $query));

if ($row && crypt($password, $row['pwd']) == $row['pwd']) {
    echo 'Welcome, ' . htmlspecialchars($username) . '!';
} else {
    echo 'Authentication failed for ' . htmlspecialchars($username) . '.';
}


?>

<!doctype html>

<html lang="en">
<head>
  <meta charset="utf-8">

  <title>Ride Share Forum</title>
  <meta name="description" content="The HTML5 Herald">

  <link rel= "stylesheet" type = "text/css" href= "forumcss.css">

  <!--[if lt IE 9]>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.3/html5shiv.js"></script>
  <![endif]-->
</head>

<body>

  <form method = "get" action ="#null">
  <ol>
  <li id ="start">
  <p>Starting Point?<p>
	<label for= "name">Insert Starting Point:</label>
	<Input type = "text" name = "name" id = "name" pattern = "[A-Za-z] + (0-9)" placeholder = "i.e 123 Gregory Street"/>

	<Input type="checkbox" name = "University" value = "def">
	<label for = "checkbox" id = "IIT">Illinois Institute of Technology</label>
  </li>

  <li id ="end">
	<p>Destination desired?<p>
	<label for= "name">Insert Destination:</label>
	<Input type = "text" name = "name" id = "name" pattern = "[A-Za-z] + (0-9)" placeholder = "i.e 123 Gregory Street"/>

	<Input type="checkbox" name = "University" value = "def">
	<label for = "checkbox" id = "IIT">Illinois Institute of Technology</label>
  </li>

  <li id ="date">
	<p>Please choose the date desire for the Ride Share<p>
	<label>Choosen date:</label>
	<input type="date" name="cday">

	<Input type="checkbox" name = "Today" value = "def">
	<label for = "checkbox">Today</label>
  </li>

  <li id ="time">
	<p>Please choose a time</p>
	<label>Select a time:</label>
	<input type="time" name="usr_time">
  </li>
 </ol>
	<input type="submit" value="Submit">
	</form>
</body>
</html>
