<?php

namespace Blog\Controllers;
use Blog\Core\Connection;
use Blog\Controllers\Post;
use Smarty;
class Guest
{
    private Post $postModel;
    private Smarty $smarty;

    public function __construct(Connection $Connection)
    {
        $this->postModel = new Post($Connection);
        $this->smarty = new Smarty();
        $this->smarty->setTemplateDir(__DIR__ . '/../../templates');
        $this->smarty->setCompileDir(__DIR__ . '/../../templates_c');
    }

    public function showHomePage()
    {
        $posts = $this->postModel->getPublishedPosts();
        $this->smarty->assign('posts', $posts);
        $this->smarty->display('guest_home.tpl');
    }

    public function showPost(int $id)
    {
        $post = $this->postModel->getPublishedPostById($id);
        if (!$post) {
            http_response_code(404);
            die("A keresett blogposzt nem található.");
        }
        $this->smarty->assign('post', $post);
        $this->smarty->display('guest_post.tpl');
    }
}