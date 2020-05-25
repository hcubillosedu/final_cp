-- INIT
SET FOREIGN_KEY_CHECKS=0;

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`(  
  `id_user` INT NOT NULL AUTO_INCREMENT,
  `email_user` VARCHAR(100) NOT NULL,
  `name_user` VARCHAR(50) NOT NULL,
  `last_name_user` VARCHAR(50) NOT NULL,
  `password` LONGTEXT NOT NULL,
  `enterprise_name` VARCHAR(100) NOT NULL,
  `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
  `state` TINYINT DEFAULT 1,
  PRIMARY KEY (`id_user`),
  KEY (`email_user`),
  UNIQUE INDEX `idx_email_user` (`email_user`)
);

DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `id_user_role` INT(11) NOT NULL AUTO_INCREMENT,
  `email_user` VARCHAR(100) NOT NULL,
  `role` ENUM('ROLE_ADMIN','ROLE_USER') NOT NULL DEFAULT 'ROLE_USER',
  PRIMARY KEY (`id_user_role`),
  UNIQUE KEY `idx_user_role_id` (`email_user`,`role`),
  CONSTRAINT `fk_ur_user` FOREIGN KEY (`email_user`) REFERENCES `users` (`email_user`) ON DELETE NO ACTION ON UPDATE NO ACTION	
);

DROP TABLE IF EXISTS `user_database`;
CREATE TABLE `user_database` (
  `id_user_database` INT(11) NOT NULL AUTO_INCREMENT,
  `id_user` INT(11) NOT NULL,
  `database_name` VARCHAR(100) NOT NULL,
  `description` LONGTEXT NULL,
  `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
  `state` TINYINT DEFAULT 1,
  PRIMARY KEY (`id_user_database`),
  CONSTRAINT `fk_ud_user` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`) ON DELETE NO ACTION ON UPDATE NO ACTION	
);

DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee` (
  `id_employee` INT(11) NOT NULL AUTO_INCREMENT,
  `id_user_database` INT(11) NOT NULL,
  `full_name` VARCHAR(250) NOT NULL,
  `age` INT(11) NOT NULL,
  `birthday` DATE NOT NULL,
  `position` VARCHAR(100) NOT NULL,
  `telephone` VARCHAR(50) NOT NULL,
  `telephone_2` VARCHAR(50) NULL,
  `address` LONGTEXT NOT NULL,
  `full_name_contact` VARCHAR(250) NOT NULL,
  `telephone_contact` VARCHAR(50) NOT NULL,
  `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
  `state` TINYINT DEFAULT 1,
  PRIMARY KEY (`id_employee`),
  CONSTRAINT `fk_ud_user_database` FOREIGN KEY (`id_user_database`) REFERENCES `user_database` (`id_user_database`) ON DELETE NO ACTION ON UPDATE NO ACTION	
);

-- INSERTS
INSERT INTO `users`(`email_user`,`name_user`,`last_name_user`,`password`,`enterprise_name`,`state`)
VALUES ('user','Sebastian','Cubillos','$2a$10$8.UnVuG9HHgffUDAlk8qfOuVGkqRzgVymGe07xd00DMxs.AQubh4a','empresa',1);


INSERT INTO `user_role`
            (`email_user`,
             `role`)
VALUES ('user',
        'ROLE_USER');
        
-- FINISH
SET FOREIGN_KEY_CHECKS=1;