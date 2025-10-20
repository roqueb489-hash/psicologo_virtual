<?php
// conexion.php
if (!defined('ACCESS')) {
    die('Direct access not permitted');
}

$host = 'localhost';
$dbname = 'psicologo_virtual';
$username = 'root'; // Reemplaza con un usuario seguro de MySQL
$password = ''; // Reemplaza con una contraseña segura

try {
    $pdo = new PDO(
        "mysql:host=$host;dbname=$dbname;charset=utf8mb4",
        $username,
        $password,
        [
            PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
            PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
            PDO::ATTR_EMULATE_PREPARES => false
        ]
    );
} catch (PDOException $e) {
    error_log("Connection error: " . $e->getMessage());
    die("Unable to connect to the database. Please try again later.");
}
?>
