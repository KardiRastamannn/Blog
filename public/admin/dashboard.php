<?php

require_once __DIR__ . '/../../vendor/autoload.php';
use Blog\controllers\Auth;
$database = new Blog\Core\Connection;
$auth = new Auth($database);

$smarty = new Smarty();
$smarty->setTemplateDir(__DIR__ . '/../../templates');
$smarty->setCompileDir(__DIR__ . '/../../templates_c');

if (!$auth->isAuthenticated() || !$auth->isAdmin()) {
    header("Location: /index.php");
    exit;
}

$user = $auth->getUser();
$smarty->assign('user', $user);
$smarty->display('admin_dashboard.tpl');