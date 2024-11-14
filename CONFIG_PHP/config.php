<?php
$host = 'localhost';
$user = 'root';
$password = '';
$dbname = 'Ecommerce';

$conn = mysqli_connect($host, $user, $password, $dbname);

if (!$conn) {
    die("Conexão falhou: " . mysqli_connect_error());
}
?>
