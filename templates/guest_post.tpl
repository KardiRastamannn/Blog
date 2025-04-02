<!DOCTYPE html>
<html lang="hu">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>{$post.title}</title>
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
        .post-meta {
            color: #6c757d;
            font-size: 0.9rem;
            margin-bottom: 2rem;
        }
        .post-meta i {
            margin-right: 0.5rem;
        }
        .post-content {
            line-height: 1.8;
            font-size: 1.1rem;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="content-card">
            <div class="d-flex justify-content-between align-items-center mb-4">
                <h1 class="mb-0">{$post.title}</h1>
                <a href="/" class="btn btn-outline-secondary">
                    <i class="fas fa-arrow-left me-2"></i>Vissza
                </a>
            </div>

            <div class="post-meta">
                <span><i class="fas fa-user"></i>{$post.author}</span>
                <span class="ms-3"><i class="fas fa-calendar"></i>{$post.publish_at}</span>
            </div>

            <div class="post-content">
                {$post.content}
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>