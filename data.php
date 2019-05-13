<?php
// показывать или нет выполненные задачи
$show_complete_tasks = rand(0, 1);
$user_id = 1;
require_once 'config/db.php';
require_once 'init.php';

$projects = get_projects($link,$user_id);
$tasks = get_tasks($link,$user_id);