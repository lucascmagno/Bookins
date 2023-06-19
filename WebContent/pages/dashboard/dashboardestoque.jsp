<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
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
                        <p>Nome Sobrenome</p>
                    </div>
                    <h2 class="h2-vendedor">�rea do vendedor</h2>
                </div>
            </div>
            <div class="livro-estoque">
                <h3 class="h3-estoque">Livros em Estoque</h3>
            </div>
        </menu>
    </header>
    <section class="livros-estoque">
        <table>
            <thead>
                <tr>
                    <th>#</th>
                    <th>Nome</th>
                    <th>Descri��o</th>
                    <th>Quantidade</th>
                    <th>Pre�o</th>
                    <th>Total</th>
                    <th>Editar</th>
                    <th>Deletar</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>1</td>
                    <td>Percy Jackson</td>
                    <td>Mitologia grega</td>
                    <td>5</td>
                    <td>29,90</td>
                    <td>149,50</td>
                    <td class="edit"><img src="./svg/edit.svg" alt=""></td>
                    <td class="delete"><img src="./svg/delete.svg" alt=""></td>
                </tr>
            </tbody>
        </table>
    </section>
</body>
</html>