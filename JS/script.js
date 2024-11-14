
function redirecionarParaLogin() {
    setTimeout(function() {
        window.location.href = 'login.php';
    }, 3000); 
}


document.addEventListener("DOMContentLoaded", function() {
    const erroMessage = document.querySelector('.erro');
    if (erroMessage) {
        setTimeout(() => {
            erroMessage.style.display = 'none';
        }, 5000); 
    }
});



document.addEventListener('DOMContentLoaded', function() {
    const btnLogin = document.querySelector('.btn-login');
    const btnCadastro = document.querySelector('.btn-cadastro');

    if (btnLogin) {
        btnLogin.addEventListener('mouseenter', () => {
            btnLogin.style.backgroundColor = '#cc0000'; // Cor mais escura
            btnLogin.style.transform = 'translateY(-5px)';
        });

        btnLogin.addEventListener('mouseleave', () => {
            btnLogin.style.backgroundColor = '#ff0000'; // Cor original
            btnLogin.style.transform = 'translateY(0)';
        });
    }

    if (btnCadastro) {
        btnCadastro.addEventListener('mouseenter', () => {
            btnCadastro.style.backgroundColor = '#cc0000'; // Cor mais escura
            btnCadastro.style.transform = 'translateY(-5px)';
        });

        btnCadastro.addEventListener('mouseleave', () => {
            btnCadastro.style.backgroundColor = '#ff0000'; // Cor original
            btnCadastro.style.transform = 'translateY(0)';
        });
    }
});
