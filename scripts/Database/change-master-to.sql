CHANGE MASTER TO 
	master_host='192.168.1.220', 
	master_user='replicate',
	master_password='slaveReplicate',
	master_log_file='mysql-bin.000001', 
  master_log_pos=107;

use master;
start slave;