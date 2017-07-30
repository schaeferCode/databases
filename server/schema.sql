CREATE DATABASE chat;

USE chat;

create table users (
  user_id int(11) not null AUTO_INCREMENT,
  username varchar(45) default null,
  PRIMARY KEY (user_id)
);

CREATE TABLE messages (
  table_id int NOT NULL AUTO_INCREMENT,
  messages varchar(45) default null,
  roomname varchar(45) default null,
  user_id int(11) not null,
  PRIMARY KEY (table_id),
  KEY fk_user (user_id),

  foreign key (user_id)
  references users (user_id)
  on update cascade
);
