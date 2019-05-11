CREATE DATABASE `230900-doingsdone-9`
	DEFAULT CHARACTER SET utf8
	DEFAULT COLLATE utf8_general_ci;
USE `230900-doingsdone-9`;
CREATE TABLE `projects` (
	id INT AUTO_INCREMENT PRIMARY KEY,
	name CHAR(128)
);
CREATE TABLE `tasks` (
	id INT AUTO_INCREMENT PRIMARY KEY,
	dt_add TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	status INT DEFAULT 0,
	name CHAR(128),
	file_link CHAR(128),
	dt_ex TIMESTAMP
);
CREATE TABLE `users` (
	id INT AUTO_INCREMENT PRIMARY KEY,
	dt_add TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	email CHAR(128) NOT NULL UNIQUE,
	name CHAR(128),
	password CHAR(64)
);
CREATE INDEX `p_name` ON `projects`(`name`);
CREATE INDEX `t_dt_add` ON `tasks`(`dt_add`);
CREATE INDEX `t_name` ON `tasks`(`name`);
CREATE INDEX `t_dt_ex` ON `tasks`(`dt_ex`);
CREATE INDEX `u_name` ON `users`(`name`);