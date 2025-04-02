<!DOCTYPE html>
<html lang="hu">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Felhasználók kezelése</title>
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
    </style>
</head>
<body>
    <div class="container">
        <div class="content-card">
            <div class="d-flex justify-content-between align-items-center mb-4">
                <h2 class="mb-0">
                    <i class="fas fa-users me-2"></i>Felhasználók kezelése
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
                            <th>Email</th>
                            <th>Szerepkör</th>
                            <th>Akciók</th>
                        </tr>
                    </thead>
                    <tbody>
                        {foreach $users as $user}
                        <tr>
                            <td>{$user.user_id}</td>
                            <td>{$user.email}</td>
                            <td>
                                <span class="badge bg-{if $user.role == 'admin'}danger{else}primary{/if}">
                                    {$user.role}
                                </span>
                            </td>
                            <td>
                                <a href="/admin/users.php?edit={$user.user_id}" class="btn btn-warning btn-sm">
                                    <i class="fas fa-edit"></i>
                                </a>
                                <form action="/admin/users.php" method="POST" class="d-inline">
                                    <input type="hidden" name="delete_user_id" value="{$user.user_id}">
                                    <button type="submit" class="btn btn-danger btn-sm" onclick="return confirm('Biztosan törlöd ezt a felhasználót?');">
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
                        {if !empty($editUser)}
                            <i class="fas fa-user-edit me-2"></i>Felhasználó módosítása
                        {else}
                            <i class="fas fa-user-plus me-2"></i>Új felhasználó létrehozása
                        {/if}
                    </h3>

                    <form action="/admin/users.php" method="POST">
                        {if !empty($editUser)}
                            <input type="hidden" name="user_id" value="{$editUser.user_id}">
                        {/if}
                        <div class="mb-3">
                            <label for="email" class="form-label">
                                <i class="fas fa-envelope me-2"></i>Email
                            </label>
                            <input type="email" id="email" name="email" class="form-control" value="{$editUser.email|default:''}" required>
                        </div>
                        <div class="mb-3">
                            <label for="password" class="form-label">
                                <i class="fas fa-lock me-2"></i>Jelszó (üresen hagyhatod)
                            </label>
                            <input type="password" id="password" name="password" class="form-control" value="{$editUser.password|default:''}">
                        </div>
                        <div class="mb-3">
                            <label for="role" class="form-label">
                                <i class="fas fa-user-tag me-2"></i>Szerepkör
                            </label>
                            <select id="role" name="role" class="form-control">
                                <option value="user" {if !empty($editUser.role) && $editUser.role == 'user'}selected{/if}>Felhasználó</option>
                                <option value="admin" {if !empty($editUser.role) && $editUser.role == 'admin'}selected{/if}>Admin</option>
                            </select>
                        </div>
                        <button type="submit" class="btn btn-success">
                            <i class="fas fa-save me-2"></i>
                            {if isset($editUser)}Módosítás{else}Létrehozás{/if}
                        </button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>