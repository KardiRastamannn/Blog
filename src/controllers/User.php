<?php
namespace Blog\controllers;
use Blog\Core\Connection;

class User
{
    private $pdo;

    public function __construct(Connection $connection)
    {
        $this->pdo = $connection->getConnection();

    }

    public function getUserByEmail(string $email): ?array
    {
        $stmt = $this->pdo->prepare("SELECT * FROM users WHERE email = :email");
        $stmt->execute(['email' => $email]);
        return $stmt->fetch() ?: null;
    }

	public function getUserById(int $id): ?array
    {
        $stmt = $this->pdo->prepare("SELECT * FROM users WHERE user_id = :user_id");
        $stmt->execute(['user_id' => $id]);
        return $stmt->fetch() ?: null;
    }

	public function getAllUsers(): array
	{
		$stmt = $this->pdo->query("SELECT * FROM users");
		return $stmt->fetchAll();
	}

	public function updateUser(int $id, string $email, string $role, string $password): bool
	{
		$stmt = $this->pdo->prepare("UPDATE users SET email = :email, role = :role, password = :password WHERE user_id = :user_id");
		$stmt->execute(['email' => $email, 'password' => $password, 'role' => $role, 'user_id' => $id]);
		header("Location: /admin/users.php");

	}

	public function deleteUser(int $id): bool
	{
		$stmt = $this->pdo->prepare("DELETE FROM users WHERE user_id = :user_id");
		$stmt->execute(['user_id' => $id]);
		header("Location: /admin/users.php");

	}

	public function createUser(string $email, string $password, string $role = 'user'): bool
	{
    	$hashedPassword = password_hash($password, PASSWORD_BCRYPT);
    	$stmt = $this->pdo->prepare("INSERT INTO users (email, password, role) VALUES (:email, :password, :role)");
    	$stmt->execute(['email' => $email, 'password' => $hashedPassword, 'role' => $role]);
		header("Location: /admin/users.php");

	}

	public function handleRequest($smarty)
    {
        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            return $this->processPostRequest();
        }

		if (isset($_GET['edit'])) {
            $editUser = $this->getUserById((int)$_GET['edit']);
			$smarty->assign('editUser', $editUser);
        }
        $users = $this->getAllUsers();
		
		$smarty->assign('users', $users);
		$smarty->display('admin_users.tpl');
    }

	private function processPostRequest()
    {
        // if (!isset($_POST['csrf_token']) || $_POST['csrf_token'] !== $_SESSION['csrf_token']) {  improve idea
        //     die("Érvénytelen CSRF token!");
        // }

		if (isset($_POST['delete_user_id'])) {
            $this->deleteUser((int)$_POST['delete_user_id']);
        } elseif (isset($_POST['email'], $_POST['password'], $_POST['role'])) {
            if (isset($_POST['user_id'])) {
                $this->updateUser((int)$_POST['user_id'], $_POST['email'], $_POST['role'], $_POST['password'],);
            } else {
				$this->createUser($_POST['email'], $_POST['password'], $_POST['role']);
            }
        }
    }
}
?>