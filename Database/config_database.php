

<?php 
  /*The following code is referenced from http://www.wikihow.com/Create-a-Secure-Login-Script-in-PHP-and-MySQL */
  define("HOST", "192.168.1.208");  //The database server 
  define("USER", "team3rocks");   //Created user that have all the rights to the database
  define("PASSWORD", "jeremytheboss");    //The password associated with the created user
  define("DATABASE", "back-end");

  define("CAN_REGISTER", "any");
  define("DEFAULT_ROLE", "member");
 
  define("SECURE", FALSE);    // FOR DEVELOPMENT ONLY!!!!

?>