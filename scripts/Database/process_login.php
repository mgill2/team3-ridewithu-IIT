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
    $_SESSION['username']=$username;
    header('Location: ../../src/welcome.html');
  }
  else {
    header('Location: ../../src/index.php');
  }
}
?>