<!DOCTYPE html>
<html lang="hu">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Blogposztok kezelése</title>
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
        .table th {
            background-color: #f8f9fa;
        }
        .btn-sm {
            padding: 0.25rem 0.5rem;
        }
        #content {
            min-height: 200px;
            resize: vertical;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="content-card">
            <div class="d-flex justify-content-between align-items-center mb-4">
                <h2 class="mb-0">
                    <i class="fas fa-blog me-2"></i>Blogposztok kezelése
                </h2>
                <a href="/admin/dashboard.php" class="btn btn-secondary">
                    <i class="fas fa-arrow-left me-2"></i>Vissza
                </a>
            </div>

            <div class="table-responsive mb-4">
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Cím</th>
                            <th>Szerző</th>
                            <th>Publikálva</th>
                            <th>Akciók</th>
                        </tr>
                    </thead>
                    <tbody>
                        {foreach $posts as $post}
                        <tr>
                            <td>{$post.post_id}</td>
                            <td>{$post.title}</td>
                            <td>{$post.author}</td>
                            <td>
                                {if $post.publish_at}
                                    <span class="badge bg-success">{$post.publish_at}</span>
                                {else}
                                    <span class="badge bg-warning">Nincs publikálva</span>
                                {/if}
                            </td>
                            <td>
                                <a href="/admin/posts.php?edit={$post.post_id}" class="btn btn-warning btn-sm">
                                    <i class="fas fa-edit"></i>
                                </a>
                                <form action="/admin/posts.php" method="POST" class="d-inline">
                                    <input type="hidden" name="delete_post_id" value="{$post.post_id}">
                                    <button type="submit" onclick="return confirm('Biztosan törlöd ezt a posztot?');" class="btn btn-danger btn-sm">
                                        <i class="fas fa-trash"></i>
                                    </button>
                                </form>
                            </td>
                        </tr>
                        {/foreach}
                    </tbody>
                </table>
            </div>

            <div class="card">
                <div class="card-body">
                    <h3 class="card-title mb-4">
                        {if !empty($editPost)}
                            <i class="fas fa-edit me-2"></i>Blogposzt módosítása
                        {else}
                            <i class="fas fa-plus me-2"></i>Új blogposzt létrehozása
                        {/if}
                    </h3>

                    <form action="/admin/posts.php" method="POST">
                        <input type="hidden" name="post_id" value="{$editPost.post_id|default:''}">
                        <input type="hidden" name="user_id" value="{$user.id|default:''}">

                        <div class="mb-3">
                            <label for="title" class="form-label">
                                <i class="fas fa-heading me-2"></i>Cím
                            </label>
                            <input type="text" id="title" name="title" class="form-control" value="{$editPost.title|default:''}" required>
                        </div>

                        <div class="mb-3">
                            <label for="content" class="form-label">
                                <i class="fas fa-file-alt me-2"></i>Tartalom
                            </label>
                            <textarea id="content" name="content" class="form-control" required>{$editPost.content|default:''}</textarea>
                        </div>

                        <div class="mb-3">
                            <label for="publish_at" class="form-label">
                                <i class="fas fa-calendar me-2"></i>Publikálási dátum
                            </label>
                            <input type="datetime-local" id="publish_at" name="publish_at" class="form-control" value="{$editPost.publish_at|default:''}">
                        </div>

                        <button type="submit" class="btn btn-success">
                            <i class="fas fa-save me-2"></i>
                            {if !empty($editPost)}Módosítás{else}Létrehozás{/if}
                        </button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>