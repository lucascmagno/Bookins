<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@page import="Bookins.dao.SelectDao"%>
<%@page import="Bookins.model.Venda"%>
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
                        User: 
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
                    <h2 class="h2-vendedor">Minhas Compras</h2>
                </div>
            </div>
            <div class="livro-estoque">
                <h3 class="h3-estoque"><a style="color: white;" class="link" href="../dashboard/dashboardvendas.jsp">In�cio</a></h3>
            </div>
        </menu>
    </header>
    <section class="livros-estoque">
    
    <% 
    // Cria uma inst�ncia do SelectDao
    SelectDao selectDao = new SelectDao();
    Venda venda = new Venda();
    
    if (sessao != null) {
        String nomeUsuario = (String) sessao.getAttribute("nomeUsuario");
        if (nomeUsuario != null) {
            // Fa�a o que for necess�rio com o valor recuperado da sess�o
    		venda.setUsuario(nomeUsuario);
            
        } else {
            // O atributo "nomeUsuario" n�o est� na sess�o
        }
    } else {
        // N�o h� sess�o existente
    }
    
    try {
        // Chama o m�todo listarMinhasCompraws para obter a lista de Vendas
        
        List<Venda> vendas = selectDao.listarMinhasCompras(venda);
        
        if (vendas != null && !vendas.isEmpty()) {
            // Exibe a tabela com os dados dos livros
    %>
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Usuario</th>
                        <th>Livro</th>
                        <th>Pre�o</th>
                        <th>Quantidade</th>
                        <th>Delete</th>
                    </tr>
                </thead>
                <tbody>
                    <% 
                    // Itera sobre a lista de livros e exibe cada um deles na tabela
                    for (Venda v: vendas) {
                    %>
                        <tr>
                            <td><%= v.getIdVenda() %></td>
                            <td><%= v.getUsuario() %></td>
                            <td><%= v.getNomeLivro() %></td>
                            <td><%= v.getPrecoLivro() %></td>
                            <td><%= v.getQuantidade() %></td>
                           	<td><a href="../livro/delete_livro.jsp?id=<%= v.getIdVenda() %>"><img alt="delete" src="../../images/delete.svg"></a></td>
                        </tr>
                    <% } %>
                </tbody>
            </table>
    <% 
        } else {
            // Exibe uma mensagem caso n�o haja livros cadastrados
    %>
            <p>N�o h� livros Comprados.</p>
    <% 
        }
    } catch (SQLException e) {
        // Exibe uma mensagem de erro caso ocorra uma exce��o ao obter a lista de livros
    %>
        <p>Ocorreu um erro ao obter a lista de livros.</p>
    <% 
        }
    %>
    </section>

</body>
</html>