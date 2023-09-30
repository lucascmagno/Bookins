<%@page import="Bookins.dao.LoginDao"%>
<%@page import="Bookins.model.LoginCadastro"%>
<%@page import="java.sql.ResultSet" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 

String usuario = request.getParameter("usuario");
String senha = request.getParameter("senha");

//Obtém a sessão atual ou cria uma nova se ainda não existir
HttpSession sessao = request.getSession(true);

//Define ou recupera valores da sessão
sessao.setAttribute("nomeUsuario", usuario);
String nomeUsuario = (String) sessao.getAttribute("nomeUsuario");

//Faça o que for necessário com a sessão e os dados armazenados nela


LoginDao loginDao = new LoginDao();
LoginCadastro login = loginDao.login(usuario, senha);


%>

<html>
<head>
    <meta charset="UTF-8">
    <title>Login</title>
</head>
<body>
    <h1>Login</h1>
    
    <%-- Cria uma instância do LoginDao --%>
    <%
       if (login != null) {
           response.sendRedirect("../dashboard/dashboardvendas.jsp");
           
     } else {
           // Exibe uma mensagem de login inválido
    
           response.sendRedirect("./login.html");
    } %>
</body>
</html>