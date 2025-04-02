<?php

namespace Blog\core;

class AuthChecker
{
    public static function checkAdmin()
    {        
        if (!isset($_SESSION['user']) || $_SESSION['user']['role'] !== 'admin') {
            header("Location: /index.php");
            exit;
        }
    }
}