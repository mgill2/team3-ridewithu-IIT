<?php
  session_start();
  require_once('connectdatabase.php');
  $id = isset($_GET['id']) ? (int) $_GET['id'] : null;
  if(!$id) {
    echo 'Some error occured! Please try again';
    exit;
  }

  $id = $_GET['id'];
  echo "<script>console.log('$id'); </script>";
  $query = "SELECT * FROM listride WHERE ID = '$id'";
  $result = mysqli_query($connection, $query);
  $count = mysqli_num_rows($result);
  $name = $_SESSION['name'];


  if($count == 1) {
    $row = mysqli_fetch_assoc($result);
    $email = $row['EMAIL'];
     echo "<script>console.log('$email'); </script>";
    if($email == $_SESSION['email']) {
      $sql = "DELETE FROM listride WHERE ID = '$id'";
      $newResult = mysqli_query($connection, $sql);
      if($newResult == true) {
        echo "<script>
          alert('Your request has been deleted successfully');
          window.location.href='../../src/ridelist.php';
          </script>";
      }
    }
    else {
      echo "<script>
          alert('Sorry! Only Requested User Can Delete Ride');
          window.location.href='../../src/ridelist.php';
          </script>";
    }
  }
  else {
    echo "<script>
          alert('Sorry! Something Went Wrong');
          window.location.href='../../src/ridelist.php';
          </script>";  }
?>
                    