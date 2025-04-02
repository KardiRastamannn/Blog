# Blog Rendszer Beüzemelési Útmutató

## 1. Rendszerkövetelmények Ellenőrzése

Ellenőrizd, hogy a következő szoftverek telepítve vannak-e a rendszeren:

- PHP 8.0 vagy újabb
- MySQL 5.7+ vagy MariaDB 10+
- Apache webszerver (mod_rewrite modul szükséges, vagy htaccess)
- Composer

## 2. Projekt Letöltése és Composer Beállítása

1. Klónozd le a projektet:
```bash
git clone [https://github.com/KardiRastamannn/Blog]
cd Blog
```

2. Telepítsd a Composer függőségeket:
```bash
composer install
```

3. Composer konfiguráció ellenőrzése:
   - A projekt a `Blog\` namespace-t használja a `src/` könyvtárban
   - Ellenőrizd, hogy minden PHP osztály a megfelelő namespace-ben van-e:
     ```php
     namespace Blog\Core;
     namespace Blog\Controllers;
     ```
   - Ha módosítottál a namespace-eken, futtasd:
     ```bash
     composer dump-autoload
     ```

4. Smarty template engine ellenőrzése:
   - A projekt Smarty 4.3 vagy újabb verziót használ
   - Ellenőrizd, hogy a `vendor/smarty/smarty` könyvtár létezik-e
   - Ha szükséges, frissítsd a Smarty-t:
     ```bash
     composer update smarty/smarty
     ```

## 3. Adatbázis Beállítása

1. Hozz létre egy új adatbázist MySQL-ben
2. Módosítsd az adatbázis kapcsolati adatokat a `src/core/Connection.php` fájlban:
```php
private $host = 'localhost';
private $dbname = 'blog';
private $username = 'root';
private $password = '';
```
3. Futtasd le az SQL mappában található scripteket.


## 4. Webszerver Beállítása

1. Állítsd be az Apache Virtual Host-ot:
```apache
<VirtualHost *:80>
    ServerName blog.local
    DocumentRoot /path/to/Blog/public
    <Directory /path/to/Blog/public>
        AllowOverride All
        Require all granted
    </Directory>
</VirtualHost>
```

2. Engedélyezd az Apache mod_rewrite modult:
```bash
a2enmod rewrite
service apache2 restart
```


## 5. Ellenőrzés

1. Nyisd meg a böngészőben: `http://blog.local` vagy `http://localhost/Blog`
2. Próbálj meg bejelentkezni az admin fiókkal:
   - Email: adrian@test.hu
   - Jelszó: asdasd1!
