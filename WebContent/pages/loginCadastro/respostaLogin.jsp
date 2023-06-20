<%@page import="Bookins.dao.LoginDao"%>
<%@page import="Bookins.model.LoginCadastro"%>
<%@page import="java.sql.ResultSet" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 

String usuario = request.getParameter("usuario");
String senha = request.getParameter("senha");

LoginCadastro login = new LoginCadastro(usuario, senha);

LoginDao loginDao = new LoginDao();
loginDao.login(usuario, senha);

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
           // Exibe os detalhes do login bem-sucedido
    %>
           <p>Login realizado com sucesso!</p>
           <p>Usuário: <%= login.getUsuario() %></p>
           <script type="text/javascript">
           window.location.href="../dashboard/dashboardvendas.jsp";
           </script>
           
    <% } else {
           // Exibe uma mensagem de login inválido
    %>
           <script type="text/javascript">
           	alert("Login inválido. Verifique suas credenciais.")
           	window.location.href="./login.html";
           </script>
    <% } %>
</body>
</html>