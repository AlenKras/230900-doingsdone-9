<?php
// показывать или нет выполненные задачи
$show_complete_tasks = rand(0, 1);
$user_id = 1;
require_once('helpers.php');
require_once ('config/db.php');
require_once ('init.php');


$content_page = include_template('index.php',[
	'show_complete_tasks' => $show_complete_tasks,
	'projects' => $projects, 
	'tasks' => $tasks
]);
$content_layout = include_template('layout.php',[
	'content_page' => $content_page,
	'projects' => $projects, 
	'tasks' => $tasks,
	'user_name' => 'Константин',
	'title_page' => 'Дела в порядке'
]);
print($content_layout);

