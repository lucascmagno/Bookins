<%@page import="Bookins.dao.SelectDao"%>
<%@page import="Bookins.model.Livro"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.SQLException"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Listagem de Livros</title>
</head>
<body>
    <h1>Listagem de Livros</h1>
    
    <% 
    // Cria uma instância do SelectDao
    SelectDao selectDao = new SelectDao();
    
    try {
        // Chama o método listarLivros para obter a lista de livros
        List<Livro> livros = selectDao.listarLivros();
        
        if (livros != null && !livros.isEmpty()) {
            // Exibe a tabela com os dados dos livros
    %>
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Título</th>
                        <th>Descrição</th>
                        <th>Preço</th>
                    </tr>
                </thead>
                <tbody>
                    <% 
                    // Itera sobre a lista de livros e exibe cada um deles na tabela
                    for (Livro livro : livros) {
                    %>
                        <tr>
                            <td><%= livro.getId() %></td>
                            <td><%= livro.getTitulo() %></td>
                            <td><%= livro.getDescricao() %></td>
                            <td><%= livro.getPreco() %></td>
                        </tr>
                    <% } %>
                </tbody>
            </table>
    <% 
        } else {
            // Exibe uma mensagem caso não haja livros cadastrados
    %>
            <p>Não há livros cadastrados.</p>
    <% 
        }
    } catch (SQLException e) {
        // Exibe uma mensagem de erro caso ocorra uma exceção ao obter a lista de livros
    %>
        <p>Ocorreu um erro ao obter a lista de livros.</p>
    <% 
        }
    %>
</body>
</html>
