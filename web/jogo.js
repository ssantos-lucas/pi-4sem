// Pinta o botão se o jogo já for favorito do usuário
function pintarBotaoFavorito() {
    var isFavorito = document.getElementById("verificaFavorito");
    var botaoFavoritar = document.getElementById('button1');
    if (isFavorito.value == "favorito") {
        botaoFavoritar.style.color = "red";
    } else if (isFavorito.value == "naofavorito") {
        botaoFavoritar.style.color = '#a8a8a8';
    }
}
// Troca a cor do botão e executa o método de favoritar
function toggle(idUsuario, idJogo) {
    var botaoFavoritar = document.getElementById('button1');
    if (botaoFavoritar.style.color == "red") {
        botaoFavoritar.style.color = '#a8a8a8';
        //desfavorita
        desfavoritar(idUsuario, idJogo);
    } else {
        botaoFavoritar.style.color = "red";
        //favorita
        favoritar(idUsuario, idJogo);
    }
    favoritar(idUsuario, idJogo);
}
// Envia o ID do usuário e do jogo para a controler com flag de valor favoritar
function favoritar(idUsuario, idJogo) {
    $.ajax({
        url: '/GameHub/Controle',
        type: 'POST',
        dataType: 'text',
        data: {
            flag: 'favoritar',
            idUsuario: idUsuario,
            idJogo: idJogo
        },
        success: function (response) {
            console.log(response);
        },
        error: function (xhr, status, error) {
            console.log('Erro na requisição: ' + error);
        }
    });
}
// Envia o ID do usuário e do jogo para a controler com flag de valor desfavoritar
function desfavoritar(idUsuario, idJogo) {
    $.ajax({
        url: '/GameHub/Controle',
        type: 'POST',
        dataType: 'text',
        data: {
            flag: 'desfavoritar',
            idUsuario: idUsuario,
            idJogo: idJogo
        },
        success: function (response) {
            console.log(response);
        },
        error: function (xhr, status, error) {
            console.log('Erro na requisição: ' + error);
        }
    });
}
