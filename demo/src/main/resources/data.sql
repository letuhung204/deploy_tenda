
CREATE TABLE IF NOT EXISTS `user`
(
    id       LONG AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(300),
    password VARCHAR(300)
);

INSERT INTO `user` (username, password)
VALUES ('admin-dante','$2a$10$KSX3/ZmYSK6udsTFRow1a.neW/k/UY5iVvx2w6iB.UhXDOnMQhNoa');
