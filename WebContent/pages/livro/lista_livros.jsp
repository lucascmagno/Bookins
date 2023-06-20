<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="Bookins.dao.SelectDao" %>
<%@ page import="Bookins.model.Livro" %>
<%@ page import="Bookins.util.Conexao" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Listagem de Livros</title>
</head>
<body>
    <h1>Listagem de Livros</h1>

    <table>
        <tr>
            <th>ID</th>
            <th>Título</th>
            <th>Descrição</th>
            <th>Preço</th>
        </tr>

        <% 
        try {
            // Cria uma nova instância de Conexao
            Conexao conexao = new Conexao();

            // Cria uma nova instância de SelectDao passando a conexão
            SelectDao selectDao = new SelectDao(conexao.getConnection());

            // Chama o método executeQuery para obter o ResultSet com os dados dos livros
            ResultSet rs = selectDao.executeQuery("SELECT * FROM livro");

            // Itera sobre o ResultSet e exibe as informações na tabela
            while (rs.next()) {
                int id = rs.getInt("id");
                String titulo = rs.getString("titulo");
                String descricao = rs.getString("descricao");
                double preco = rs.getDouble("preco");

                out.println("<tr>");
                out.println("<td>" + id + "</td>");
                out.println("<td>" + titulo + "</td>");
                out.println("<td>" + descricao + "</td>");
                out.println("<td>" + preco + "</td>");
                out.println("</tr>");
            }

            // Fecha a conexão com o banco de dados
            conexao.fecharConexao();
        } catch (SQLException e) {
            out.println("Erro ao listar os livros: " + e.getMessage());
        }
        %>
    </table>
</body>
</html>
