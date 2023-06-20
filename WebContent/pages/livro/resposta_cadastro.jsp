<%@page import="Bookins.dao.CadastroDao"%>
<%@page import="Bookins.model.Livro"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 

boolean ok = false;

Livro livro = new Livro();
livro.setTitulo(request.getParameter("titulo"));
livro.setDescricao(request.getParameter("descricao"));
livro.setPreco(Double.valueOf(request.getParameter("preco")).doubleValue());

CadastroDao livroDao = new CadastroDao();
ok = livroDao.inserirLivro(livro);

if(ok){
%>
<script type="text/javascript">
	alert("Livro cadastrado com sucesso!");
	window.location.href="./lista_livros.jsp";
</script>
<%}else{ %>
<script type="text/javascript">
	alert("Erro ao cadastrar o livro");
	window.location.href="./cadastro_livro.jsp";
</script>
<%} %>
