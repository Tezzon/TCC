<?php
session_start();


if (!isset($_SESSION['usuario_id'])) {
    header("Location: login.php");
    exit();
}
?>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FlashBuy</title>
    <link rel="stylesheet" href="../CSS/style.css">
</head>
<body>

<header class="navbar">
    <div class="logo">Minha Loja</div>
    <nav>
        <a href="index.php">Início</a>
        <a href="logout.php">Sair</a>
        <a href="carrinho.php">Carrinho</a>
    </nav>
</header>

<div class="container">
    <h1>Bem-vindo à Minha Loja!</h1>
    <!-- Conteúdo da página principal -->
</div>

<footer>
    <p>&copy; 2024 FlashBuy. Todos os direitos reservados.</p>
</footer>

</body>
</html>
