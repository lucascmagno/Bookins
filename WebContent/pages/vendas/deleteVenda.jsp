<%@page import="Bookins.dao.VendasDao"%>
<%@page import="Bookins.model.Venda"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 

boolean ok = false;

Venda venda = new Venda();
venda.setIdVenda(Integer.parseInt(request.getParameter("id")));

VendasDao deleteDao = new VendasDao();
ok = deleteDao.deleteVenda(venda);

if(ok){
%>
<script type="text/javascript">
	alert("Venda apagada com sucesso!");
	window.location.href="./vendas.jsp";
</script>
<%}else{ %>
<script type="text/javascript">
	alert("Erro ao apagar a venda");
	window.location.href="./vendas.jsp";
</script>
<%} %>
