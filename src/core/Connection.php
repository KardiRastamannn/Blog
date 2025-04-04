<?php
namespace Blog\Core;
use PDO;
use PDOExceptions;
 class Connection {

	private string $host = 'localhost'; // This could be in a config file.
	private string $db = 'blog';
	private string $user = 'root';
	private string $pass = '';
	private string $charset = 'utf8mb4';
	private $pdo;

	public function __construct()
	{

		$dsn = "mysql:host={$this->host};dbname={$this->db};charset={$this->charset}";
		$opt = [
			PDO::ATTR_ERRMODE            => PDO::ERRMODE_EXCEPTION,
			PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
			PDO::ATTR_EMULATE_PREPARES   => false,
		];
		try {
			$this->pdo = new PDO($dsn, $this->user, $this->pass, $opt);
		} catch(PDOException $e) {
		 	die("Adatbázis kapcsolat sikertelen: " . $e->getMessage());
		}
	}

	public function getConnection(): ?PDO
	{
		return $this->pdo;
	}

	public function pdoQuery($query, $values = []) {
		global $con;
		$stmt = [];
		if(!empty($con)){
			if(!empty($values)) {
				$stmt = $con->prepare($query);
				$stmt->execute($values);
			} else {
				$stmt = $con->query($query);
			}
		}
		$con = null;

		return $stmt;
	}
}

?>