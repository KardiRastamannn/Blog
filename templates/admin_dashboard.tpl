<!DOCTYPE html>
<html lang="hu">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .dashboard-card {
            background: white;
            border-radius: 10px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            transition: transform 0.2s;
        }
        .dashboard-card:hover {
            transform: translateY(-3px);
        }
    </style>
</head>
<body>
    <div class="container py-5">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="dashboard-card p-4 mb-4">
                    <h2 class="mb-4">Admin Dashboard</h2>
                    <p class="mb-4">Üdvözlünk, {$user.email}!</p>
                    
                    <div class="d-grid gap-3">
                        <a href="/admin/users.php" class="btn btn-primary">
                            <i class="fas fa-users me-2"></i>Felhasználók kezelése
                        </a>
                        <a href="/admin/posts.php" class="btn btn-primary">
                            <i class="fas fa-blog me-2"></i>Posztok kezelése
                        </a>
                        <a href="/logout.php" class="btn btn-danger mt-3">
                            <i class="fas fa-sign-out-alt me-2"></i>Kijelentkezés
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>