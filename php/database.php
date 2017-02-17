<?php 
 session_start();

  require 'vendor/autoload.php';

   
   
       $link = mysqli_connect($endpoint,"zjaks","onthecloud","school") or die("Error " . mysqli_error($link));
       $create_table_admin = 'CREATE TABLE IF NOT EXISTS admin  
       (
          id INT NOT NULL AUTO_INCREMENT,
          upload INT NOT NULL,
          PRIMARY KEY(id)
       )';

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
        if (!($stmt = $link->prepare("INSERT INTO admin (id, upload) VALUES (NULL,?)"))) {   
        }
        $upload = 1;
        $stmt->bind_param("i",$upload);
        if (!$stmt->execute()) {
             echo "Execute failed: (" . $stmt->errno . ") " . $stmt->error;
          }
       $stmt->close();
       }

       $link->real_query("SELECT * FROM admin");
        $res = $link->use_result();

        while ($row = $res->fetch_assoc()) {
        $uploadOn=$row['upload'];
	}
       $link->close();
       
?>