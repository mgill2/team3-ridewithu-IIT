CREATE USER 'replicate'@'192.168.1.221' IDENTIFIED BY 'slaveReplicate';
GRANT REPLICATION SLAVE ON *.* TO 'replicate'@'192.168.1.221';
CREATE USER 'team3rocks'@'192.168.1.221' IDENTIFIED BY 'jeremytheboss';
GRANT ALL ON *.* TO 'team3rocks'@'192.168.1.221';
FLUSH PRIVILEGES;