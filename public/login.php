<?php

require_once __DIR__ . '/../vendor/autoload.php';

$database = new Blog\Core\Connection;
use Blog\controllers\Auth;

$auth = new Auth($database);
$smarty = new Smarty();

$smarty->setTemplateDir(__DIR__ . '/../templates');
$smarty->setCompileDir(__DIR__ . '/../templates_c');


if ($auth->isAuthenticated()) {
    header("Location: /admin/dashboard.php");
    exit;
}

$error = '';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $email = $_POST['email'] ?? '';
    $password = $_POST['password'] ?? '';

    if ($auth->login($email, $password)) {
        header("Location: /admin/dashboard.php");
        exit;
    } else {
        $error = "Hibás e-mail vagy jelszó!";
    }
}

$smarty->assign('error', $error);
$smarty->display('login.tpl');