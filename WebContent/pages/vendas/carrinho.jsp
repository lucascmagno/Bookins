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
    <script async src="../../javascript/carrinho.js"></script>
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
    <form action="respostaVenda.jsp" method="get">
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
                                <th>remover</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr class="tr1">
                                <td class="tbody">
                                    <div class="product">
                                        <img src="../../images/imageDefault.svg" alt="">
                                        <div class="info">
                                            <div class="name"><%=livro.getTitulo() %></div>
                                            <div class="categoria">Edição de ----</div>
                                            <div class="estoque">Em estoque</div>
                                        </div>
                                    </div>
                                </td>
                                <td>
                                    <div class="qty">
                                    		<input class="quantidade" value="<%=livro.getId() %>" type="hidden" name="idLivro">
                                            <input class="quantidade" value="1" type="number" name="quantidade" min="1">
                                    </div>
                                </td>
                                <td class="preco">R$ <%=livro.getPreco() %></td>
                                <td>
                                    <button class="remover"><i class='bx bx-x'></i></button>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </section>
                <aside class="aside">
                    <div class="box">
                        <header>Resumo da Compra</header>
                        <div class="info1">
                                <div><span>Subtotal</span><span class="subtotal"> R$ <%=livro.getPreco() %></span></div>
                                <div><span>Frete</span><span class="frete" value=""> R$ 0</span></div>
                                <div><button>Adicionar cupom de desconto <i class='bx bx-right-arrow-alt'></i></button></div>
                        </div>
                        <footer>
                            <span>Total</span>
                            <span class="total"> R$ <%=livro.getPreco() %></span>
                        </footer>
                    </div>
                    <button class="finalizar">Finalizar Compra <i class='bx bx-check'></i></button>
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
    
    <script type="text/javascript">
    if (document.readyState == "loading"){
        document.addEventListener("DOMContentLoaded", ready);
    } else {
        ready();
    }

    function ready(){
        const removerProdutos= document.getElementsByClassName("remover") ;
        console.log(removerProdutos);
        for (var i=0; i<removerProdutos.length; i++){
            removerProdutos[i].addEventListener("click", removerProduto);
        }
        
        const quantidadeInput = document.getElementsByClassName("tr1");
        for (var i=0; i<quantidadeInput.length; i++){
            quantidadeInput[i].addEventListener("change", valorTotal);
        }
    }

    function removerProduto(event){
        event.target.parentElement.parentElement.parentElement.parentElement.parentElement.remove();
        valorTotal();
    }

    function valorTotal(){
        let valorTotal = 0;
        const carroProdutos = document.getElementsByClassName("tr1");
        for(var i=0; i<carroProdutos.length; i++){
            console.log(carroProdutos[i]);
            const produtoPreco = carroProdutos[i].getElementsByClassName("preco")[0].innerText.replace("R$", "").replace(",", ".");
            const produtoQuantidade = carroProdutos[i].getElementsByClassName("quantidade")[0].value;
            valorTotal += produtoPreco * produtoQuantidade;
        }
        valorTotal = valorTotal.toFixed(2);
        valorTotal = valorTotal.replace(".", ",");
        document.querySelector(".subtotal").innerText = "R$" + valorTotal;
        total();
    }

    function total(){
        let total = 0; 
        const resumoValor = document.getElementsByClassName("info1"); 
        for(var i=0; i<resumoValor.length; i++){
            console.log(resumoValor[i]);
            const carroSubtotal = resumoValor[i].getElementsByClassName("subtotal")[0].innerText.replace("R$", "").replace(",", "."); 
            const produtoFrete = resumoValor[i].getElementsByClassName("frete")[0].innerText.replace("R$", "").replace(",", ".");
            total += carroSubtotal + produtoFrete; 
        }
        console.log(typeof total); 
        total = Number(total);
        total = total.toFixed(2); 
        total = total.replace(".", ","); 
        document.querySelector(".total").innerText = "R$" + total; 
    }

    </script>
</body>
</html>
