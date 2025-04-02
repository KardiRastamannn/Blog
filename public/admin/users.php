<?php

require_once __DIR__ . '/../../vendor/autoload.php';

use Blog\controllers\Auth;
use Blog\controllers\User;
$database = new Blog\Core\Connection;
$auth = new Auth($database);
$userController = new User($database);
$smarty = new Smarty();

$smarty->setTemplateDir(__DIR__ . '/../../templates');
$smarty->setCompileDir(__DIR__ . '/../../templates_c');

//session_start();

if (!$auth->isAuthenticated() || !$auth->isAdmin()) {
    header("Location: /index.php");
    exit;
}

$userController->handleRequest($smarty);