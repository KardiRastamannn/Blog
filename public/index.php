<?php

require_once __DIR__ . '/../vendor/autoload.php';

$database = new Blog\Core\Connection;
use Blog\Controllers\Guest;

$controller = new Guest($database);
$controller->showHomePage();