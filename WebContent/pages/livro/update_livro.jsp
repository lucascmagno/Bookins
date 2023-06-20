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
</head>
<body>
    <%
    // Obter o ID do livro a ser editado a partir dos par�metros da requisi��o
    int livroId = Integer.parseInt(request.getParameter("id"));
    
    // Criar uma inst�ncia do DAO
    SelectDao selectDao = new SelectDao();
    
    try {
        // Obter o livro com base no ID fornecido
        Livro livro = selectDao.getLivroById(livroId);
        
        if (livro != null) {
    %>
    <form action="respostaUpdate.jsp" method="POST">
        <input name="id" type="hidden" value="<%= livro.getId() %>">
        T�tulo <input type="text" name="titulo" value="<%= livro.getTitulo() %>"><br>
        Descri��o <textarea rows="5" cols="33" name="descricao"><%= livro.getDescricao() %></textarea><br>
        Pre�o <input type="number" name="preco" min="0.00" value="<%= livro.getPreco() %>"><br>
        <input type="submit" value="Atualizar">
    </form>
    <a href="./lista_livros.jsp">Voltar</a>
    <% } else { %>
    <p>O livro n�o foi encontrado.</p>
    <% } %>
    <% } catch (SQLException e) { %>
    <p>Ocorreu um erro ao obter os dados do livro: <%= e.getMessage() %></p>
    <% } %>
</body>
</html>
