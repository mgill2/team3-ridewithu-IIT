<?php
  include_once 'connectdatabase.php';
  include_once 'functions.php';

  start_session();
  
  if(isset($_POST['email'], $_POST['p'])) {
  	$email = $_POST['email'];
  	$password = $_POST['p'];

  	if(login($email, $password, $mysqli) == true) {
  		//login success
  		header('Location: ../welcome.html');
  	}
  	else {
  		header('Location: ../index.html?error=1');
  	}
  }
  else {
  	echo 'Invalid credentials';
  }