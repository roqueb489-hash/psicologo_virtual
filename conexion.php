<?php
// conexion.php
if (!defined('ACCESS')) {
    die('Direct access not permitted');
}

$host = 'localhost';
$dbname = 'psicologo_virtual';
$username = 'root'; // Por defecto en XAMPP
$password = ''; // Sin contraseña por defecto en XAMPP

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
    http_response_code(500);
    echo json_encode(['error' => 'Unable to connect to the database. Please try again later.']);
    exit;
}
?>
