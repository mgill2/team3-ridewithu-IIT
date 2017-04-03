<?php 
 session_start();

  require 'vendor/autoload.php';

   
		//echo begin database
       $link = mysqli_connect($endpoint,"zjaks","onthecloud","school") or die("Error " . mysqli_error($link)); 
	   // does this need to be new when making a connection?
       $create_table_admin = 'CREATE TABLE IF NOT EXISTS admin  
       (
          id INT NOT NULL AUTO_INCREMENT,
          upload INT NOT NULL,
          PRIMARY KEY(id)
       )';
	   //check connection
		if($link->connect_errno){
			echo "Failed to connect to MySql: (". $mysqli->connect_errno . ") " . $mysqli->connect_error;
		}
		
		
		
      $create_tbl_adm = $link->query($create_table_admin);
      if ($create_table_adm) {
      }
      else {
      }
	  
	   
		
		
      $link->real_query("SELECT * FROM admin");
      $res = $link->use_result();
      $count = 0;
      while ($row = $res->fetch_assoc()) {
        $count=$count+1;
      }

      if($count > 0){
      }
      else {
		 /* Prepared statement, stage 1: prepare */
        if (!($stmt = $link->prepare("INSERT INTO admin (id, upload) VALUES (NULL,?)"))) {   
        }
		/*Prepared statement, stage 2: bind and execute */
        $upload = 1;
        $stmt->bind_param("i",$upload);
		if (!$stmt->bind_param("i",$upload)){
			echo "Binding parameters failed: (" . $stmt->errno . ") " . $stmt->error;
		}
        if (!$stmt->execute()) {
             echo "Execute failed: (" . $stmt->errno . ") " . $stmt->error;
          }
		  /*printf("%d Row inserted.\n", $stmt->affected_rows);*/
		  /*exlpicit close recomended */
       $stmt->close();
       }

       $link->real_query("SELECT * FROM admin");
        $res = $link->use_result();

        while ($row = $res->fetch_assoc()) {
			$uploadOn=$row['upload'];
			//echo $row[] . " " .$row[]. " " . $row[];
			//this will echo out the fields inputed for visual use and proper input
	}
	
       $link->close();
       
?>