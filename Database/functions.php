<?php
  include_once 'config_database.php';

  function start_session() {
    $session_name = 'sec_session_id';
    $secure = true; 
    $httponly = true;
  }

  if (ini_set('session.use_only_cookies', 1) === FALSE) {
      header("Location: ../error.php?err=Could not initiate a safe session (ini_set)");
      exit();
    }
?>