<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ page import="Bookins.dao.SelectDao" %>
<%@ page import="Bookins.model.Livro" %>
<%@ page import="java.util.List" %>
<%@ page import="java.sql.SQLException" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Editar Livro</title>
    <link rel="stylesheet" href="../../css/cad.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@100&display=swap" rel="stylesheet">
</head>
<body>
<div class="topo">
        <h1>EDITE UM LIVRO</h1>
    </div>
    <%
    // Obter o ID do livro a ser editado a partir dos parâmetros da requisição
    int livroId = Integer.parseInt(request.getParameter("id"));
    
    // Criar uma instância do DAO
    SelectDao selectDao = new SelectDao();
    
    try {
        // Obter o livro com base no ID fornecido
        Livro livro = selectDao.getLivroById(livroId);
        
        if (livro != null) {
    %>
    <form action="respostaUpdate.jsp" method="POST">
        <div class="caixa">
        <input name="id" type="hidden" value="<%= livro.getId() %>">
            <p>Título </p> <input required type="text" name="titulo" id="titulo" value="<%= livro.getTitulo() %>"><br>
            <p> Descrição </p> <textarea rows="5" cols="33" name="descricao" id="descricao"><%= livro.getDescricao() %></textarea><br>
            <p> Preço </p> <input type="number" name="preco" min="0.00" id="preco" value="<%= livro.getPreco() %>"><br>
        </div>
        <div class="botao">
        <input type="submit" value="Adicionar" id="botao">
        </div>
    </form>
    <a href="../dashboard/dashboardestoque.jsp" id="voltar">Voltar</a>
    <% } else { %>
    <p>O livro não foi encontrado.</p>
    <% } %>
    <% } catch (SQLException e) { %>
    <p>Ocorreu um erro ao obter os dados do livro: <%= e.getMessage() %></p>
    <% } %>
</body>
</html>
