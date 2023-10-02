<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@page import="Bookins.dao.SelectDao"%>
<%@page import="Bookins.model.Livro"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.SQLException"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../../css/carrinho.css">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <script async src="js/index.js"></script>
    <title>Carrinho de Compras</title>
</head>
<body>
    <header class="cabecalho">
        <span>Carrinho de Compras</span>
    </header>
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
    <form>
        <main>
            <div class="page_title" >
                <i class='bx bx-cart-alt'></i>
                <p>Seu Carrinho</p>
            </div>
            <div class="content">
                <section class="section">
                    <table>
                        <thead>
                            <tr>
                                <th>Descrição</th>
                                <th>Qtd</th>
                                <th>Preço</th>
                                <th>Subtotal</th>
                                <th>remover</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr class="tr1">
                                <td class="tbody">
                                    <div class="product">
                                        <img src="imagens/pjo.jpg" alt="">
                                        <div class="info">
                                            <div class="name"><%=livro.getTitulo() %></div>
                                            <div class="categoria">Edição de ----</div>
                                            <div class="estoque">Em estoque</div>
                                        </div>
                                    </div>
                                </td>
                                <td>
                                    <div class="qty">
                                            <input type="number" name="qtde" min="1">
                                    </div>
                                </td>
                                <td class="preco">R$ <%=livro.getPreco() %></td>
                                <td class="subtotal">R$ 120</td>
                                <td>
                                    <button class="remover"><i class='bx bx-x'></i></button>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </section>
                <aside>
                    <div class="box">
                        <header>Resumo da Compra</header>
                        <div class="info">
                            <div><span>Subtotal</span><span> R$ 180</span></div>
                            <div><span>Frete</span><span> Gratuito</span></div>
                            <div><button>Adicionar cupom de desconto <i class='bx bx-right-arrow-alt'></i></button></div>
                        </div>
                        <footer>
                            <span>Total</span>
                            <span> R$ 418</span>
                        </footer>
                    </div>
                    	<button class="finalizar"><a href="./respostaVenda.jsp?id=<%= livro.getId()%>">Finalizar Compra </a><i class='bx bx-check'></i></button>
                </aside>
            </div>
        </main>
    </form>
    <% } else { %>
    <p>O livro não foi encontrado.</p>
    <% } %>
    <% } catch (SQLException e) { %>
    <p>Ocorreu um erro ao obter os dados do livro: <%= e.getMessage() %></p>
    <% } %>
</body>
</html>
