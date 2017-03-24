<?php
include_once 'Database/connectdatabase.php';
include_once 'Database/functions.php';

start_session();

if (login_users_only($mysqli) == true) {
  $logged = 'in';
}
else {
  $logged = 'out';
}
?>

<!DOCTYPE html>
<html lang="en">

  <head>
    <title>Login - IIT Ride Share</title>
    <meta charset="utf-8" />
    <link rel="shortcut icon" href="img/myiit.gif">
    <meta name="viewport" content="width=device-width,initial-scale=1.0,shrink-to-fit=no" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/4.1.1/normalize.min.css" />
    <link rel="stylesheet" href="screen.css" />
  </head>

  <body class="login">
    <?php
     if (isset($_GET['error'])) {
      echo '<p class="error">Error Logging In!</p>'; 
     }
    ?>
    <header>
      <h1 class="page-greeting">Illinois Tech Ride Share</h1>
    </header>

    <main>
      <img class="logo" src="img/IITScarletHawks.png" alt="IIT Logo">
      <!-- We would use POST but we want the login button to go to the index page -->
      <form action="Database/process_login.php" method="post" name="login_form">
        <input type="text" placeholder="Username" id="username" name="username" title="IIT username" required>
        <input type="password" placeholder="Password" id="password" title="Password must be 8 or more characters" required>
       <!--name="password"-->
        <input type="submit" id="submit" name="submit" value="Login" onclick="formhash(this.form, this.form.password);" />

        <div class="security">
          <p>
            <img src="img/secure.svg" alt="Lock" />
            For security reasons, please sign out and exit your web browser when you are finished accessing authenticated services.
          </p>

        </div>
      </form>
    </main>
  </body>
</html>
