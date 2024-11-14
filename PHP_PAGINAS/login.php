<?php
session_start();
?>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - FlashBuy</title>
    <link rel="stylesheet" href="../CSS/style.css">
    <script src="../JS/script.js"></script>
</head>
<body>


<div class="container">
<h2>Entrar</h2>
    <?php
    
    if (isset($_SESSION['erro'])) {
        echo "<p class='erro'>" . $_SESSION['erro'] . "</p>";
        unset($_SESSION['erro']); 
    }
    ?>
    <form action="../CONFIG_PHP/processar_login.php" method="POST">
        <div class="input-group">
            <label for="email">Email</label>
            <input type="email" id="email" name="email" required>
        </div>
        <div class="input-group">
            <label for="senha">Senha</label>
            <input type="password" id="senha" name="senha" required>
        </div>
        <button type="submit" class="btn-login">Entrar</button>
        <p>Não tem uma conta? <a href="cadastro.php">Cadastre-se</a></p>
    </form>
</div>

<footer>
    <p>&copy; 2024 Minha Loja. Todos os direitos reservados.</p>
</footer>

</body>
</html>
