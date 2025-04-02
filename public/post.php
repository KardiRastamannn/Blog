<?php

require_once __DIR__ . '/../vendor/autoload.php';

$database = new Blog\Core\Connection;
use Blog\Controllers\Guest;
$controller = new Guest($database);

if (!isset($_GET['id']) || !is_numeric($_GET['id'])) {
    http_response_code(400);
    die("Érvénytelen blogposzt azonosító.");
}

$controller->showPost((int)$_GET['id']);