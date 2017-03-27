<?php
  include_once 'connectdatabase.php';
  include_once 'functions.php';

  start_session();
  
  if(isset($_POST['email'], $_POST['p'])) {
  	$email = $_POST['email'];
  	$password = $_POST['p'];

  	if(login($email, $password, $mysqli) == true) {
  		//login success
  		header('Location: ../welcome.php');
  	}
  	else {
  		header('Location: ../index.php?error=1');
  	}
  }
  else {
  	echo 'Invalid credentials';
  }

?>