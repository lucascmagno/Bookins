<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="Bookins.dao.EstoqueDao"%>
<%@page import="Bookins.model.Estoque"%>
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
     <% 
    // Cria uma instância do SelectDao
    EstoqueDao selectDao = new EstoqueDao();
    
    try {
        // Chama o método listarLivros para obter a lista de livros
        List<Estoque> estoque = selectDao.listarEstoque();
        
        if (estoque != null && !estoque.isEmpty()) {
            // Exibe a tabela com os dados dos livros
    %>
        <table>
            <thead>
                <tr>
                    <th>#</th>
                    <th>Nome</th>
                    <th>Descrição</th>
                    <th>Quantidade</th>
                    <th>Preço</th>
                    <th>Total</th>
                    <th>Editar</th>
                    <th>Deletar</th>
                </tr>
            </thead>
             <% 
                    // Itera sobre a lista de livros e exibe cada um deles na tabela
                    for (Estoque estoque1 : estoque) {
                    %>
                        <tr>
                            <td><%= estoque1.getId() %></td>
                            <td><%= estoque1.getNome() %></td>
                            <td><%= estoque1.getDescricao() %></td>
                            <td><%= estoque1.getQuantidade() %></td>
                            <td><%= estoque1.getPreco() %></td>
                            <td><%= estoque1.getTotal() %></td>
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
        </table>
    </section>

</body>
</html>