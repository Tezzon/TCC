<?php
session_start();
?>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cadastro</title>
    <link rel="stylesheet" href="../CSS/style.css">
    <script src="../JS/script.js"></script> 
</head>
<body>

<div class="container">
    <h2>Cadastro - FlashBuy</h2>
    <?php 
        if (isset($_SESSION['erro'])) {
            echo "<p class='erro'>" . $_SESSION['erro'] . "</p>";
            unset($_SESSION['erro']); 
        }

        if (isset($_SESSION['sucesso'])) {
            echo "<p class='sucesso'>" . $_SESSION['sucesso'] . "</p>";
            unset($_SESSION['sucesso']); 
            echo "<script>setTimeout(function() { window.location.href = 'login.php'; }, 3000);</script>"; 
        }
    ?>
    <form action="../CONFIG_PHP/processar_cadastro.php" method="POST">
    <div class="input-group">
        <label for="nome">Nome</label>
        <input type="text" id="nome" name="nome" required>
    </div>
    <div class="input-group">
        <label for="email">Email</label>
        <input type="email" id="email" name="email" required>
    </div>
    <div class="input-group">
        <label for="senha">Senha</label>
        <input type="password" id="senha" name="senha" required>
    </div>
    <div class="input-group">
        <label for="confirmar_senha">Confirmar Senha</label>
        <input type="password" id="confirmar_senha" name="confirmar_senha" required>
    </div>
    <button type="submit" class="btn-cadastro">Cadastrar</button>
    <button type="button" class="btn-cadastro" onclick="window.location.href='login.php'">Voltar para o Login</button>
    </form>
</div>

<footer>
    <p>&copy; 2024 FlashBuy. Todos os direitos reservados.</p>
</footer>

</body>
</html>
