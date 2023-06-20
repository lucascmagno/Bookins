<%@page import="Bookins.dao.SelectDao"%>
<%@page import="Bookins.model.Livro"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.SQLException"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Listagem de Livros</title>
    <style>
	table{
		border-collapse: collapse;
		border: 1px solid #333;
	}
	th, tr, td{
		border: 1px solid #333;
	}
</style>
</head>
<body>
    <h1>Listagem de Livros</h1>
    
    <% 
    // Cria uma inst�ncia do SelectDao
    SelectDao selectDao = new SelectDao();
    
    try {
        // Chama o m�todo listarLivros para obter a lista de livros
        List<Livro> livros = selectDao.listarLivros();
        
        if (livros != null && !livros.isEmpty()) {
            // Exibe a tabela com os dados dos livros
    %>
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>T�tulo</th>
                        <th>Descri��o</th>
                        <th>Pre�o</th>
                        <th>Edit</th>
                        <th>Delete</th>
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
                           	<td><a href="./update_livro.jsp?id=<%= livro.getId() %>"><img alt="edit" src="../../images/edit.svg"></a></td>
                            <td><a href="./delete_livro.jsp?id=<%= livro.getId() %>"><img alt="delete" src="../../images/delete.svg"></a></td>
                        </tr>
                    <% } %>
                </tbody>
            </table>
            <a href="../dashboard/dashboardestoque.jsp">Voltar</a>
    <% 
        } else {
            // Exibe uma mensagem caso n�o haja livros cadastrados
    %>
            <p>N�o h� livros cadastrados.</p>
    <% 
        }
    } catch (SQLException e) {
        // Exibe uma mensagem de erro caso ocorra uma exce��o ao obter a lista de livros
    %>
        <p>Ocorreu um erro ao obter a lista de livros.</p>
    <% 
        }
    %>
</body>
</html>
