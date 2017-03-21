<?php
  include_once 'config_database.php';

  function start_session() {
    $session_name = 'sec_session_id';
    $secure = true; 
    $httponly = true;
  }

?>