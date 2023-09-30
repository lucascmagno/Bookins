<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@page import="Bookins.dao.VendasDao"%>
<%@page import="Bookins.model.Venda"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.SQLException"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Vendas</title>
<link rel="stylesheet" href="../../css/dashboardestoque.css">
</head>
<body>
	<header>
        <menu>
            <div class="top-header">
                <div class="user" style="align-items: center; justify-content: center;">
                    <h2 class="h2-vendedor">Vendas Realizadas</h2>
                </div>
            </div>
        </menu>
    </header>
    <section class="livros-estoque">
    
    <% 
    // Cria uma instância do VendaDao
    VendasDao vendasDao = new VendasDao();
    
    try {
        // Chama o método listarLivros para obter a lista de livros
        List<Venda> venda = vendasDao.listarVendas();
        
        if (venda != null && !venda.isEmpty()) {
            // Exibe a tabela com os dados dos livros
    %>
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Usuario</th>
                        <th>Livro</th>
                        <th>Preço</th>
                        <th>Editar</th>
                        <th>Deletar</th>
                    </tr>
                </thead>
                <tbody>
                    <% 
                    // Itera sobre a lista de livros e exibe cada um deles na tabela
                    for (Venda vendas : venda) {
                    %>
                        <tr>
                        	<td><%= vendas.getIdVenda()%></td>
                            <td><%= vendas.getUsuario() %></td>
                            <td><%= vendas.getNomeLivro() %></td>
                            <td><%= vendas.getPrecoLivro()%></td>
                           	<td><a href="../livro/update_livro.jsp?id=<%= vendas.getIdVenda() %>"><img alt="edit" src="../../images/edit.svg"></a></td>
                            <td><a href="../livro/delete_livro.jsp?id=<%= vendas.getIdVenda() %>"><img alt="delete" src="../../images/delete.svg"></a></td>
                        </tr>
                    <% } %>
                </tbody>
            </table>
    <% 
        } else {
            // Exibe uma mensagem caso não haja livros cadastrados
    %>
            <p>Não há vendas cadastrados.</p>
    <% 
        }
    } catch (SQLException e) {
        // Exibe uma mensagem de erro caso ocorra uma exceção ao obter a lista de livros
    %>
        <p>Ocorreu um erro ao obter a lista de vendas.</p>
    <% 
        }
    %>
    <a class="link" href="../dashboard/dashboardestoque.jsp">Voltar</a>
    </section>

</body>
</html>