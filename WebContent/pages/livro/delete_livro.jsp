<%@page import="Bookins.dao.CadastroDao"%>
<%@page import="Bookins.model.Livro"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 

boolean ok = false;

Livro livro = new Livro();
livro.setId(Integer.parseInt(request.getParameter("id")));

CadastroDao livroDao = new CadastroDao();
ok = livroDao.deleteLivro(livro);

if(ok){
%>
<script type="text/javascript">
	alert("Livro apagado com sucesso!");
	window.location.href="../dashboard/dashboardestoque.jsp";
</script>
<%}else{ %>
<script type="text/javascript">
	alert("Erro ao apagar o livro");
	window.location.href="../dashboard/dashboardestoque.jsp";
</script>
<%} %>
