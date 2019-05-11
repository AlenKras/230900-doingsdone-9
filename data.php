<?php
// показывать или нет выполненные задачи
$show_complete_tasks = rand(0, 1);
$db = require_once 'config/db.php';

$link = mysqli_connect($db['host'], $db['user'], $db['password'], $db['database']);
mysqli_set_charset($link, "utf8");

if (!$link) {
    $error = mysqli_connect_error();
    $content = include_template('error.php', ['error' => $error]);
}
else {
    $sql = 'SELECT c_t.id, c_t.name, c_t.c_tasks FROM users u
			JOIN (
			SELECT p.id, p.user_id, p.name, COUNT(t.id) as c_tasks FROM projects p
			LEFT JOIN tasks t ON p.id = t.project_id
			GROUP BY p.id 
			) c_t ON u.id = c_t.user_id
			WHERE u.id=1 ORDER BY c_t.id ASC';
    $result = mysqli_query($link, $sql);
    if ($result) {
        $projects = mysqli_fetch_all($result, MYSQLI_ASSOC);
    }
	else {
        $error = mysqli_error($link);
        $content = include_template('error.php', ['error' => $error]);
    }
	$sql = 'SELECT t.* FROM users u
			JOIN tasks t ON u.id = t.user_id
			WHERE u.id=1';
    $result = mysqli_query($link, $sql);
    if ($result) {
        $tasks = mysqli_fetch_all($result, MYSQLI_ASSOC);
    }
	else {
        $error = mysqli_error($link);
        $content = include_template('error.php', ['error' => $error]);
    }
}