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
            <div class="top-header">
                <div class="user">
                    <div class="img">
                        Image
                        <p>
                        		<%
			                    HttpSession sessao = request.getSession(false); // Use false para n�o criar uma nova sess�o, caso n�o exista
			                    if (sessao != null) {
			                        String nomeUsuario = (String) sessao.getAttribute("nomeUsuario");
			                        if (nomeUsuario != null) {
			                            // Fa�a o que for necess�rio com o valor recuperado da sess�o
			                            out.println(nomeUsuario);
			                        } else {
			                            // O atributo "nomeUsuario" n�o est� na sess�o
			                        }
			                    } else {
			                        // N�o h� sess�o existente
			                    }
			
								%>
                        </p>
                    </div>
                    <h2 class="h2-vendedor">�rea do vendedor</h2>
                </div>
            </div>
            <div class="livro-estoque">
                <h3 class="h3-estoque"><a style="color: white;" class="link" href="../livro/cadastro_livro.jsp">Adicionar Livros</a></h3>
                <h3 class="h3-estoque"><a style="color: white;" class="link" href="../vendas/vendas.jsp">Vendas Realizadas</a></h3>
            </div>
        </menu>
    </header>
    <section class="livros-estoque">
    
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
                           	<td><a href="../livro/update_livro.jsp?id=<%= livro.getId() %>"><img alt="edit" src="../../images/edit.svg"></a></td>
                            <td><a href="../livro/delete_livro.jsp?id=<%= livro.getId() %>"><img alt="delete" src="../../images/delete.svg"></a></td>
                        </tr>
                    <% } %>
                </tbody>
            </table>
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
    <a class="link" href="dashboardvendas.jsp">Voltar</a>
    </section>

</body>
</html>