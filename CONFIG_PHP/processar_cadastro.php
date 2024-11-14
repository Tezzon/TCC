<?php
session_start();
include('../CONFIG_PHP/config.php');

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $nome = mysqli_real_escape_string($conn, $_POST['nome']);
    $email = mysqli_real_escape_string($conn, $_POST['email']);
    $senha = mysqli_real_escape_string($conn, $_POST['senha']);
    $confirmar_senha = mysqli_real_escape_string($conn, $_POST['confirmar_senha']);

    if ($senha !== $confirmar_senha) {
        $_SESSION['erro'] = "As senhas não coincidem!";
        header("Location: ../PHP_PAGINAS/cadastro.php");
        exit();
    }

    $senha_hash = password_hash($senha, PASSWORD_DEFAULT);

    $sql = "SELECT * FROM usuario WHERE email = '$email'";
    $result = mysqli_query($conn, $sql);

    if (mysqli_num_rows($result) > 0) {
        $_SESSION['erro'] = "E-mail já cadastrado!";
        header("Location: ../PHP_PAGINAS/cadastro.php");
        exit();
    }

    $sql_insert = "INSERT INTO usuario (nome, email, senha) VALUES ('$nome', '$email', '$senha_hash')";
    
    if (mysqli_query($conn, $sql_insert)) {
        $_SESSION['sucesso'] = "Cadastro realizado com sucesso! Redirecionando para o login...";
        header("Location: ../PHP_PAGINAS/cadastro.php");
        exit();
    } else {
        $_SESSION['erro'] = "Erro ao realizar o cadastro.";
        header("Location: ../PHP_PAGINAS/cadastro.php");
        exit();
    }
}

mysqli_close($conn);
?>
