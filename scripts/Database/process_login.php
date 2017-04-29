<?php
  session_start();
  require_once('connectdatabase.php');

if(isset($_POST) && !empty($_POST)) {
  $username = $_POST['username'];
  $password = $_POST['password'];

  $sql = "SELECT * FROM users WHERE USERNAME='$username' AND PASSWORD='$password'";
  $result = mysqli_query($connection, $sql);
  echo $count = mysqli_num_rows($result);

  if($count == 1) {
    $row = mysqli_fetch_assoc($result);
    //$_SESSION['first_name'] = $row["FIRST_NAME"];
    //$_SESSION['last_name'] = $row["LAST_NAME"];
    $name = $row["FIRST_NAME"] . ' ' . $row["LAST_NAME"];
    $_SESSION['name'] = $name;
    $_SESSION['email'] = $row["EMAIL"];
    $_SESSION['username']=$username;
    header('Location: ../../src/welcome.php');
  }
  else {
    header('Location: ../../src/index.php');
  }
}
?>