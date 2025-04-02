<?php

require_once __DIR__ . '/../vendor/autoload.php';

$database = new Blog\Core\Connection;
use Blog\controllers\Auth;

$auth = new Auth($database);
$auth->logout();