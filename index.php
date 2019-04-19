<?php
require_once('helpers.php');
// показывать или нет выполненные задачи
$show_complete_tasks = rand(0, 1);
$projects = ["Входящие","Учеба","Работа","Домашние дела","Авто"];
$tasks = [
[
	"title" => "Собеседование в IT компании",
	"date" => "01.12.2018",
	"project" => "Работа",
	"status" => false
],
[
	"title" => "Выполнить тестовое задание",
	"date" => "25.12.2018",
	"project" => "Работа",
	"status" => false
],
[
	"title" => "Сделать задание первого раздела",
	"date" => "21.12.2018",
	"project" => "Учеба",
	"status" => true
],
[
	"title" => "Встреча с другом",
	"date" => "22.12.2018",
	"project" => "Входящие",
	"status" => false
],
[
	"title" => "Купить корм для кота",
	"date" => "Нет",
	"project" => "Домашние дела",
	"status" => false
],
[
	"title" => "Заказать пиццу",
	"date" => "Нет",
	"project" => "Домашние дела",
	"status" => false
]
];
function count_tasks($list_tasks, $name) {
    $c_tasks = 0;
	foreach ($list_tasks as $list) {
		if ($list["project"]===$name) {
			$c_tasks++;
		}
	}
    return $c_tasks;
}
function esc($str) {
	$text = htmlspecialchars($str);
	return $text;
}

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

