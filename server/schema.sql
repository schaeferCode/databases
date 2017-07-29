CREATE DATABASE chat;

USE chat;

CREATE TABLE messages (
  message_id int(11) not null AUTO_INCREMENT,
  message varchar(45) default null,
  created DATE default null,
  PRIMARY KEY (message_id),
  FOREIGN KEY (user_id) references users(user_id),
  FOREIGN KEY (room_id) references rooms(room_id)
);

/* Create other tables and define schemas for them here! */




/*  Execute this file from the command line by typing:
 *    mysql -u root < server/schema.sql
 *  to create the database and the tables.*/

