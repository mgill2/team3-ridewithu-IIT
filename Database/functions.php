<?php
  include_once 'config_database.php';

  function start_session() {
    $session_name = 'sec_session_id';
    $secure = true; 
    $httponly = true;

  if (ini_set('session.use_only_cookies', 1) === FALSE) {
      header("Location: ../error.php?err=Could not initiate a safe session (ini_set)");
      exit();
    }

   session_set_cookie_params($cookieParams["lifetime"],
        $cookieParams["path"], 
        $cookieParams["domain"], 
        $secure,
        $httponly);
 
    session_start();            // Start the PHP session 
    session_regenerate_id(true);    // regenerated the session, delete the old one. 
}

  function login($email, $password, $mysqli) {
    if ($stmt = $mysqli->prepare("SELECT ID, FIRST_NAME, LAST_NAME, USERNAME, PASSWORD
      FROM items WHERE EMAIL=? LIMIT 1")) {
        $stmt->bind_param('s', $email);
        $stmt->execute();
        $stmt->store_result();

      //now getting variables from this query
        $stmt->bind_result($member_id, $member_fname, $member_lname, $member_username, $member_password);
        $stmt->fetch();

      if($stmt->num_rows == 1) {
        //check if password is matches with database
          if (password_verify($password, $member_password)) {
            //password is correct
            $user_browser = $_SERVER['HTTP_USER_AGENT'];

            $user_id = preg_replace("/[^0-9]+/", "", $user_id);
            $_SESSION['user_id'] = $user_id;
            //protection
            $username = preg_replace("/[^a-zA-Z0-9_\-]+/", "", $username);
            $_SESSION['username'] = $username;
            $_SESSION['credentials'] = hash('dipen20695', $member_password . $user_browser);
            return true; //login successful                 
          }
          else {
            return false;
          }
        }
        else {
          return false;
        } 
      }
  }

  function login_users_only($mysqli) {
    //checking if the session variables are set or not
    if (isset($_SESSION['user_id'], $_SESSION['username'],
        $_SESSION['credentials'])) {
      $user_id = $_SESSION['user_id'];
      $username = $_SESSION['username'];
      $credentials = $_SESSION['credentails'];

      $user_browser = $_SERVER['HTTP_USER_AGENT'];
    }
  }
?>