<!DOCTYPE html>
<html lang="hu">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Blog</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .content-card {
            background: white;
            border-radius: 10px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            margin: 2rem auto;
            padding: 2rem;
        }
        .blog-card {
            border: none;
            border-radius: 10px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.05);
            transition: transform 0.2s;
        }
        .blog-card:hover {
            transform: translateY(-3px);
        }
        .blog-card .card-body {
            padding: 1.5rem;
        }
        .blog-meta {
            color: #6c757d;
            font-size: 0.9rem;
        }
        .blog-meta i {
            margin-right: 0.5rem;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="content-card">
            <div class="d-flex justify-content-between align-items-center mb-4">
                <h2 class="mb-0">
                    <i class="fas fa-blog me-2"></i>Blog
                </h2>
                {if isset($user)}
                    <div class="d-flex align-items-center">
                        <span class="me-3">Üdvözöllek, {$user.email}!</span>
                        <a href="/logout.php" class="btn btn-outline-danger">
                            <i class="fas fa-sign-out-alt me-2"></i>Kijelentkezés
                        </a>
                    </div>
                {else}
                    <a href="/login.php" class="btn btn-outline-success">
                        <i class="fas fa-user me-2"></i>Admin
                    </a>
                {/if}
            </div>

            <div class="row">
                {foreach $posts as $post}
                <div class="col-md-6 mb-4">
                    <div class="blog-card card h-100">
                        <div class="card-body">
                            <h5 class="card-title">{$post.title}</h5>
                            <div class="blog-meta mb-3">
                                <span><i class="fas fa-user"></i>{$post.author}</span>
                                <span class="ms-3"><i class="fas fa-calendar"></i>{$post.publish_at}</span>
                            </div>
                            <p class="card-text">{substr($post.content, 0, 200)}...</p>
                            <a href="post.php?id={$post.post_id}" class="btn btn-outline-primary">
                                <i class="fas fa-book-reader me-2"></i>Olvasd tovább
                            </a>
                        </div>
                    </div>
                </div>
                {/foreach}
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>