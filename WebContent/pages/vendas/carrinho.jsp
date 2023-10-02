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
                                <th>Descri��o</th>
                                <th>Qtd</th>
                                <th>Pre�o</th>
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
                                            <div class="name">Nome do produto</div>
                                            <div class="categoria">Edi��o de 2014</div>
                                            <div class="estoque">Em estoque</div>
                                        </div>
                                    </div>
                                </td>
                                <td>
                                    <div class="qty">
                                            <input type="number" name="qtde" min="1">
                                    </div>
                                </td>
                                <td class="preco">R$ 120</td>
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
                    <button class="finalizar">Finalizar Compra <i class='bx bx-check'></i></button>
                </aside>
            </div>
        </main>
    </form>
</body>
</html>
