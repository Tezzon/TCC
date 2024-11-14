<?php
session_start();
include('../CONFIG_PHP/config.php');

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $email = mysqli_real_escape_string($conn, $_POST['email']);
    $senha = mysqli_real_escape_string($conn, $_POST['senha']);

    
    $query = "SELECT * FROM usuario WHERE email = '$email'";
    $result = mysqli_query($conn, $query);

   
    if (mysqli_num_rows($result) > 0) {
        $user = mysqli_fetch_assoc($result);

        
        if (password_verify($senha, $user['senha'])) {
            $_SESSION['usuario_id'] = $user['id'];
            $_SESSION['usuario_nome'] = $user['nome'];

            
            header("Location: ../PHP_PAGINAS/index.php");
            exit();
        } else {
            
            $_SESSION['erro'] = "Senha incorreta!";
            header("Location: ../PHP_PAGINAS/login.php");
            exit();
        }
    } else {
        
        $_SESSION['erro'] = "Usuário não encontrado!";
        header("Location: ../PHP_PAGINAS/login.php");
        exit();
    }
}

mysqli_close($conn);
?>
