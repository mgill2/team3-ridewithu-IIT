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
      } 
  }
?>