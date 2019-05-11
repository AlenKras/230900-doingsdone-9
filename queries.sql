-- Создание списка пользователей
INSERT INTO `users` (`email`,`name`,`password`) VALUES
('kostas@gmail.com','Константин','274b8023a96969c1cc4eed61fd053394f8c28872'),
('dimon@gmail.com','Дмитрий','274b8023a96969c1cc4eed61fd053394f8c28873');

-- Создание списка проектов
INSERT INTO `projects` (`name`,`user_id`) VALUES
('Входящие',1),
('Учеба',1),
('Работа',1),
('Домашние дела',1),
('Авто',1);

-- Создание списка задач
INSERT INTO `tasks` (`status`,`name`,`dt_ex`,`user_id`,`project_id`) VALUES
(0,'Собеседование в IT компании','2019-04-21 00:00:00',1,3),
(0,'Выполнить тестовое задание','2018-12-25 00:00:00',1,3),
(1,'Сделать задание первого раздела','2018-12-21 00:00:00',1,2),
(0,'Встреча с другом','2018-12-22 00:00:00',1,1),
(0,'Купить корм для кота',NULL,1,4),
(0,'Заказать пиццу',NULL,1,4);

-- Получение количества задач для списка проектов одного пользователя (по ID пользователя)
SELECT c_t.id, c_t.name, c_t.c_tasks FROM users u
JOIN (
SELECT p.id, p.user_id, p.name, COUNT(t.id) as c_tasks FROM projects p
LEFT JOIN tasks t ON p.id = t.project_id
GROUP BY p.id 
) c_t ON u.id = c_t.user_id
WHERE u.id=1 ORDER BY c_t.id ASC

-- Получение списка из всех задач для одного проекта (по ID проекта)
SELECT t.name FROM projects p
JOIN tasks t ON p.id = t.project_id
WHERE p.id=3

-- Отметить задачу, как выполненную (по ID задачи)
UPDATE tasks SET status = 1 WHERE id = 2;

-- Обновление названия задачи (по ID задачи)
UPDATE tasks SET name = name WHERE id = 2;