<?php
namespace Blog\controllers;
use Blog\Core\Connection;

class Post
{
    private $pdo;

    public function __construct(Connection $connection)
    {
        $this->pdo = $connection->getConnection();

    }

	public function getAllPosts(): array
    {
        $stmt = $this->pdo->query("SELECT posts.*, users.email AS author FROM posts JOIN users ON posts.user_id = users.user_id ORDER BY created_at DESC");
        return $stmt->fetchAll();
    }

    public function getPostById(int $id): ?array
    {
        $stmt = $this->pdo->prepare("SELECT * FROM posts WHERE post_id = ?");
        $stmt->execute([$id]);
        return $stmt->fetch() ?: null;
    }

    public function createPost(int $userId, string $title, string $content, ?string $publishAt): bool
    {
        $stmt = $this->pdo->prepare("INSERT INTO posts (user_id, title, content, publish_at) VALUES (?, ?, ?, ?)");
        $stmt->execute([$userId, $title, $content, $publishAt]);
		header("Location: /admin/posts.php");
    }

    public function updatePost(int $id, string $title, string $content, ?string $publishAt): bool
    {
        $stmt = $this->pdo->prepare("UPDATE posts SET title = ?, content = ?, publish_at = ? WHERE post_id = ?");
        $stmt->execute([$title, $content, $publishAt, $id]);
		header("Location: /admin/posts.php");

    }

    public function deletePost(int $id): bool
    {
        $stmt = $this->pdo->prepare("DELETE FROM posts WHERE post_id = ?");
        $stmt->execute([$id]);
		header("Location: /admin/posts.php");
    }

	public function getPublishedPosts(): array
	{
		$stmt = $this->pdo->query("SELECT posts.*, users.email AS author FROM posts JOIN users ON posts.user_id = users.user_id WHERE publish_at IS NOT NULL AND publish_at <= NOW() ORDER BY created_at DESC");
		return $stmt->fetchAll();
	}

	public function getPublishedPostById(int $id): ?array
	{
		$stmt = $this->pdo->prepare("SELECT posts.*, users.email AS author FROM posts JOIN users ON posts.user_id = users.user_id WHERE posts.post_id = ? AND publish_at IS NOT NULL AND publish_at <= NOW()");
		$stmt->execute([$id]);
		return $stmt->fetch() ?: null;
	}

	public function handleRequest($smarty)
    {
        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            return $this->processPostRequest();
        }

		if (isset($_GET['edit'])) {
            $editPost = $this->getPostById((int)$_GET['edit']);
			$smarty->assign('editPost', $editPost);
			$smarty->assign('user', (int)$_SESSION['user']);
        }

        $posts = $this->getAllPosts();
		
		$smarty->assign('posts', $posts);
		$smarty->display('admin_posts.tpl');
    }

	private function processPostRequest()
    {
        // if (!isset($_POST['csrf_token']) || $_POST['csrf_token'] !== $_SESSION['csrf_token']) {   improve idea
        //     die("Érvénytelen CSRF token!");
        // }
        if (isset($_POST['delete_post_id'])) {
            $this->deletePost((int)$_POST['delete_post_id']);
        } elseif (isset($_POST['title'], $_POST['content'])) {
            $publishAt = $_POST['publish_at'] ?? null;
            if (!empty($_POST['post_id'])) {
                $this->updatePost((int)$_POST['post_id'], $_POST['title'], $_POST['content'], $publishAt);
            } else {
                $this->createPost((int)$_SESSION['user']['id'], $_POST['title'], $_POST['content'], $publishAt);
            }
        }
    }
}
?>