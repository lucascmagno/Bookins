<%@page import="Bookins.dao.CadastroDao"%>
<%@page import="Bookins.model.Livro"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 

boolean ok = false;

Livro livro = new Livro();
livro.setId(Integer.parseInt(request.getParameter("id")));
livro.setTitulo(request.getParameter("titulo"));
livro.setDescricao(request.getParameter("descricao"));
String precoStr = request.getParameter("preco");
if (precoStr != null && !precoStr.isEmpty() && precoStr.matches("\\d+(\\.\\d+)?")) {
    double preco = Double.parseDouble(precoStr);
    livro.setPreco(preco);
} else {
	double preco = Double.parseDouble("0.00");
    livro.setPreco(preco);
}

CadastroDao livroDao = new CadastroDao();
ok = livroDao.updateLivro(livro);

if(ok){
%>
<script type="text/javascript">
	alert("Livro cadastrado com sucesso!");
	window.location.href="./lista_livros.jsp";
</script>
<%}else{ %>
<script type="text/javascript">
	alert("Erro ao cadastrar o livro");
	window.location.href="./lista_livros.jsp";
</script>
<%} %>
