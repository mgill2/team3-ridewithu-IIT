<?php
  session_start();
  require_once('connectdatabase.php');

  if(!is_int($_GET['id'])) {
    echo 'Some error occured! Please try again';
    exit;
  }

  $id = $_GET['id'];

  $query = "SELECT * FROM listride WHERE ID = '$id'";
  $result = mysqli_query($connection, $sql);
  $count = mysqli_num_rows($result);

  if($count == 1) {
    $row = mysqli_fetch_assoc($result);
    $email = $row['EMAIL'];
    if($email == $_SESSION['email']) {
      echo '<script>alert("Please Wait For Driver"); </script>';
    }
    else {
    header('Location: ../../src/ridelist.php');
    }
  }
?>