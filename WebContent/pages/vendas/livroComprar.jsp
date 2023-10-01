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
    <form action="respostaUpdate.jsp" method="POST">
        <div class="caixa">
        <input name="id" type="hidden" value="<%= livro.getId() %>">
            <p>Título </p> <input required type="text" name="titulo" id="titulo" value="<%= livro.getTitulo() %>"><br>
            <p> Descrição </p> <textarea rows="5" cols="33" name="descricao" id="descricao"><%= livro.getDescricao() %></textarea><br>
            <p> Preço </p> <input type="number" name="preco" min="0.00" id="preco" value="<%= livro.getPreco() %>"><br>
        </div>
        <div class="botao">
        <input type="submit" value="Adicionar" id="botao">
        </div>
    </form>
    <a href="../dashboard/dashboardestoque.jsp" id="voltar">Voltar</a>
    <% } else { %>
    <p>O livro não foi encontrado.</p>
    <% } %>
    <% } catch (SQLException e) { %>
    <p>Ocorreu um erro ao obter os dados do livro: <%= e.getMessage() %></p>
    <% } %>


    <header class="cabecalho">
        <span>BOOK'INS</span>
    </header>
    <main>
        <div class="content">
            <section class="section">
                <table>
                    <thead>
                        <tr>
                            <th>Livros <i class='bx bx-chevron-right'></i></th>
                            <th>Literatura e Ficção <i class='bx bx-chevron-right'></i></th>
                            <th>Literatura Mundial</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr class="corpo">
                            <td class="tbody">
                                <div class="produto">
                                    <img src="imagens/pjo.jpg" alt="">
                                    <div class="info">
                                        <div class="info2">
                                            <div class="nome">A Maldição do Titã - Percy Jackson e os Olimpianos 3</div>
                                            <div class="avaliacao">4,9<span><i class='bx bxs-star' style='color:#e4fd30'></i><i class='bx bxs-star' style='color:#e4fd30'></i><i class='bx bxs-star' style='color:#e4fd30'></i><i class='bx bxs-star' style='color:#e4fd30'></i><i class='bx bxs-star' style='color:#e4fd30'></i><i class='bx bx-chevron-down' undefined ></i></span><span class="azul">3.435 avaliações de clientes</span></div>
                                            <div class="autor">por<span class="azul">Rick Riordan</span>(Autor),<span class="azul"> Raquel Zampil</span>(Tradutor)</div>
                                            <div class="sequencia"> <span class="azul">Livro 3 de 5: Percy Jackson e os Olimpianos</span></div>
                                            <div class="resumo"></div>
                                        </div>
                                        <div class="boxInfo">
                                            <div class="box1">
                                                <div> 
                                                <header>Kindle</header>
                                                <span>R$35,00</span>
                                                </div>
                                            </div>
                                            <div class="box2">
                                                <div>
                                                <header>Capa Comum</header>
                                                <span>R$ 44,99</span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="botao">
                                            <div class="botao1"><button>Adicionar ao Carrinho</button></div>
                                        </div>
                                        <div class="botaoAgora">
                                            <div class="botao2"><button>Comprar Agora</button></div>
                                            </div>
                                    </div>
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </section>
        </div>
    </main>
</body>
</html>
