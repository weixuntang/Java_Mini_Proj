drop schema if exists `login-n-logout`;

CREATE SCHEMA `login-n-logout`;

use `login-n-logout`;

CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_preferred_name` varchar(128) DEFAULT NULL,
  `email_address` varchar(45) DEFAULT NULL UNIQUE,
  `password` varchar(45) DEFAULT NULL,
  `active` boolean DEFAULT NULL,
  `admin` boolean DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;