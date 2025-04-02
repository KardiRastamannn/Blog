<?php

namespace Blog\Controllers;

use Blog\Core\Connection;

class Auth
{
    private User $userModel;
    private Connection $connection;

    public function __construct(Connection $connection)
    {
        $this->userModel = new User($connection);
        session_start();
    }

    public function login(string $email, string $password): bool
    {
        $user = $this->userModel->getUserByEmail($email);
        if (!empty($user)){ //&& password_verify($password, $user['password'])) {  improve idea
            $_SESSION['user'] = [
                'id' => $user['user_id'],
                'email' => $user['email'],
                'role' => $user['role']
            ];
            return true;
        }

        return false;
    }

    public function logout(): void
    {
        session_destroy();
        header("Location: /index.php");
        exit;
    }

    public function isAuthenticated(): bool
    {
        return isset($_SESSION['user']);
    }

    public function isAdmin(): bool
    {
        return $this->isAuthenticated() && $_SESSION['user']['role'] === 'admin';
    }

    public function getUser(): ?array
    {
        return $_SESSION['user'] ?? null;
    }
}