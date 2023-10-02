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
    <link rel="stylesheet" href="../../css/livroComprar.css">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <title>Livro</title>
</head>
<body>
    <header class="cabecalho">
        <span>BOOK'INS</span>
    </header>
    <main>
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
    <div class="content">
            <section class="section">
                <table>
                    <thead>
                        <tr>
                            <th><a href="../dashboard/dashboardvendas.jsp">Livros </a><i class='bx bx-chevron-right'></i></th>
                            <th>Literatura e Ficção <i class='bx bx-chevron-right'></i></th>
                            <th>Literatura Mundial</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr class="corpo">
                            <td class="tbody">
                                <div class="produto">
                                    <img src="../../images/imageDefault.svg" alt="">
                                    <div class="info">
                                        <div class="info2">
                                            <div class="nome"><%=livro.getTitulo() %></div>
                                            <div class="avaliacao">4,9<span><i class='bx bxs-star' style='color:#e4fd30'></i><i class='bx bxs-star' style='color:#e4fd30'></i><i class='bx bxs-star' style='color:#e4fd30'></i><i class='bx bxs-star' style='color:#e4fd30'></i><i class='bx bxs-star' style='color:#e4fd30'></i><i class='bx bx-chevron-down' undefined ></i></span><span class="azul">3.435 avaliações de clientes</span></div>
                                            <div class="autor">por<span class="azul">--------</span>(Autor),<span class="azul">--------</span>(Tradutor)</div>
                                            <div class="sequencia"> <span class="azul">Livro x de y: <%=livro.getTitulo() %></span></div>
                                            <div class="resumo"></div>
                                        </div>
                                        <div class="boxInfo">
                                            <div class="box1">
                                                <div> 
                                                <header>Kindle</header>
                                                <span id="kindle">R$35,00</span>
                                                </div>
                                            </div>
                                            <div class="box2">
                                                <div>
                                                <header>Capa Comum</header>
                                                <span>R$ <%=livro.getPreco() %></span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="botao">
                                            <div class="botao1"><a href="./carrinho.jsp?id=<%=livro.getId()%>"><button>Adicionar ao Carrinho</button></a></div>
                                        </div>
                                        <div class="botaoAgora">
                                            <div class="botao2"><a href="./carrinho.jsp?id=<%=livro.getId()%>"><button>Comprar Agora</button></a></div>
                                            </div>
                                    </div>
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </section>
        </div>
    <% } else { %>
    <p>O livro não foi encontrado.</p>
    <% } %>
    <% } catch (SQLException e) { %>
    <p>Ocorreu um erro ao obter os dados do livro: <%= e.getMessage() %></p>
    <% } %>
        
    </main>
</body>
</html>
