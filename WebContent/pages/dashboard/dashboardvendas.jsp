<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="Bookins.dao.SelectDao"%>
<%@page import="Bookins.model.Livro"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.SQLException"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Venda de Livros</title>
    <link rel="stylesheet" href="../../css/dashboardvendas.css">
    <style>
    a{
      text-decoration: none;
    }
    </style>
</head>
<body>
	<header>
        <menu>
            <div class="top-header">
                <div class="logo">
                    <h1>BOOK'INS</h1>
                </div>
                <div class="user">
                    <div class="img"></div>
                    <p>Olá, <br> 
                   <%
                    HttpSession sessao = request.getSession(false); // Use false para não criar uma nova sessão, caso não exista
                    if (sessao != null) {
                        String nomeUsuario = (String) sessao.getAttribute("nomeUsuario");
                        if (nomeUsuario != null) {
                            // Faça o que for necessário com o valor recuperado da sessão
                            out.println(nomeUsuario);
                        } else {
                            // O atributo "nomeUsuario" não está na sessão
                        }
                    } else {
                        // Não há sessão existente
                    }

					%>
                    </p>
                    <input class="input-pesquisa input-pesquisa2" type="search" name="pesquisa" id="ipesquisa">
                </div>
                <hr style="height: 45px; margin: 10px 15px;">
                <div class="lista">
                    <p>Minhas compras</p>
                    <p><a class="link" href="./dashboardestoque.jsp">Painel do Vendedor</a></p>
                </div>
            </div>
            <div class="pesquisa">
                <input class="input-pesquisa input-pesquisa1" type="search" name="pesquisa" id="ipesquisa">
            </div>
            <nav>
                <ul class="ul-navbar">
                    <div class="link1">
                        <li><a href="#">Estantes</a></li>
                        <li><a href="#">Sebos e Livros</a></li>
                        <li><a href="#livros">Livros Recomendados</a></li>
                        <li><a href="#">Mais vendidos</a></li>
                    </div>
                    <div class="link2">
                        <li><a href="#">Central de Ajuda</a></li>
                    </div>
                </ul>
            </nav>
        </menu>
    </header>
    <section>
        <div class="destaque">
            <h1 class="h1-destaque">CONFIRA NOSSAS OFERTAS!</h1>
            <h2 class="h2-destaque">Livros com até 80% de desconto.</h2>
        </div>
        
        <div class="livros" id="livros">
               <div class="container">
        <% 
    // Cria uma instância do SelectDao
    SelectDao selectDao = new SelectDao();
    
    try {
        // Chama o método listarLivros para obter a lista de livros
        List<Livro> livros = selectDao.listarLivros();
        
        if (livros != null && !livros.isEmpty()) {
            // Exibe a tabela com os dados dos livros
    %>
            <% 
            // Itera sobre a lista de livros e exibe cada um deles na tabela
            for (Livro livro : livros) {
            %>	<a href="../vendas/livroComprar.jsp?id=<%=livro.getId()%>">
                <div class="content">
                    <img src="../../images/imageDefault.svg" alt="">
                    <h3 class="titulo-card"><%=livro.getTitulo() %></h3>
                    <div class="inf-card">
                        <div class="desconto-card">
                            Até 70% off
                        </div>
                        <div class="preco-card">
                            <span style="color: #0E649A; font-weight: bold;">Oferta</span>
                            <span style="font-weight: bold;">R$ <%=livro.getPreco() %></span>
                        </div>
                    </div>
                </div>
                </a>
            <% } %>
    <% 
        } else {
            // Exibe uma mensagem caso não haja livros cadastrados
    %>
            </div> 
		  </div>
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