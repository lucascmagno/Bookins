<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="css/cad.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@100&display=swap" rel="stylesheet">
</head>
<body>
    <div class="topo">
        <h1>CADASTRE UM LIVRO</h1>
    </div>
    <form action="resposta_cadastro.jsp" method="POST">
        <div class="caixa">
            <p>Título </p> <input type="text" name="titulo" id="titulo"><br>
            <p> Descriçao </p> <textarea rows="5" cols="33" name="descricao" id="descricao"></textarea><br>
            <p> Preço </p> <input type="number" name="preco" min="0.00" id="preco"><br>
        </div>
        <div class="botao">
        <input type="submit" value="Adicionar" id="botao">
        </div>
    </form>
</body>
</html>
