<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@page import="Bookins.dao.SelectDao"%>
<%@page import="Bookins.model.Livro"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.SQLException"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dashboard Estoque</title>
<link rel="stylesheet" href="../../css/dashboardestoque.css">
</head>
<body>
	<header>
        <menu>
        <a class="link" href="dashboardvendas.jsp">Voltar</a>
            <div class="top-header">
                <div class="user">
                    <div class="img">
                        Image
                        <p>Nome Sobrenome</p>
                    </div>
                    <h2 class="h2-vendedor">Área do vendedor</h2>
                </div>
            </div>
            <div class="livro-estoque">
                <h3 class="h3-estoque"><a href="../livro/lista_livros.jsp" class="link">Livros em Estoque</h3>
                <h3 class="h3-estoque"><a class="link" href="../livro/cadastro_livro.jsp">Adicionar Livros</a></h3>
            </div>
        </menu>
    </header>
    <section class="livros-estoque">
       
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
                           	<td><a href="../livro/update_livro.jsp?id=<%= livro.getId() %>"><img alt="edit" src="../../images/edit.svg"></a></td>
                            <td><a href="../livro/delete_livro.jsp?id=<%= livro.getId() %>"><img alt="delete" src="../../images/delete.svg"></a></td>
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
    </section>

</body>
</html>