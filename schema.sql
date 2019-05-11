CREATE DATABASE `230900-doingsdone-9`
	DEFAULT CHARACTER SET utf8
	DEFAULT COLLATE utf8_general_ci;
USE `230900-doingsdone-9`;
CREATE TABLE `projects` (
	id INT AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(128),
	user_id INT
);
CREATE TABLE `tasks` (
	id INT AUTO_INCREMENT PRIMARY KEY,
	dt_add TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	status TINYINT DEFAULT 0,
	name VARCHAR(128),
	file_link VARCHAR(128),
	dt_ex TIMESTAMP,
	user_id INT,
	project_id INT
);
CREATE TABLE `users` (
	id INT AUTO_INCREMENT PRIMARY KEY,
	dt_add TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	email VARCHAR(128) NOT NULL UNIQUE,
	name VARCHAR(128),
	password VARCHAR(64)
);
CREATE INDEX `p_name` ON `projects`(`name`);
CREATE INDEX `t_dt_add` ON `tasks`(`dt_add`);
CREATE INDEX `t_name` ON `tasks`(`name`);
CREATE INDEX `t_dt_ex` ON `tasks`(`dt_ex`);
CREATE INDEX `u_name` ON `users`(`name`);