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
  UNIQUE INDEX `idx_email_user` (`email_user`),
  UNIQUE INDEX `idx_enterprise_name` (`enterprise_name`)
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

-- INSERTS
INSERT INTO `users`
            (`email_user`,
             `name_user`,
             `last_name_user`,
             `password`,
             `enterprise_name`,
             `state`)
VALUES ('user',
        'Sebastian',
        'Cubillos',
        '$2a$10$8.UnVuG9HHgffUDAlk8qfOuVGkqRzgVymGe07xd00DMxs.AQubh4a',
        'empresa',
        1);


INSERT INTO `user_role`
            (`email_user`,
             `role`)
VALUES ('user',
        'ROLE_USER');
        
-- FINISH
SET FOREIGN_KEY_CHECKS=1;