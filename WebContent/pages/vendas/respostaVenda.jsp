<%@page import="Bookins.dao.VendasDao"%>
<%@page import="Bookins.model.Venda"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<%
// Cria uma instância do VendasDao
VendasDao vendasDao = new VendasDao();
Venda venda = new Venda();
HttpSession sessao = request.getSession(false); // Use false para não criar uma nova sessão, caso não exista

boolean ok = false;
int idLivro = Integer.parseInt(request.getParameter("idLivro"));
int quantidade = Integer.parseInt(request.getParameter("quantidade"));
if (sessao != null) {
    String nomeUsuario = (String) sessao.getAttribute("nomeUsuario");

    if (nomeUsuario != null) {
        try {
            // Chame o método para obter a lista de favoritos
            venda.setUsuario(nomeUsuario);
            venda.setIdLivro(idLivro);
            venda.setQuantidade(quantidade);
            int idUsuario  = vendasDao.getIdUsuario(nomeUsuario);
            if(idUsuario > 0){
                venda.setIdUsuario(idUsuario);
            }
            ok = vendasDao.inserirVenda(venda);
            if(ok){
            %>
            	<script>
            		alert("Compra realizada com sucesso");
            		window.location.href = "../dashboard/dashboardvendas.jsp";
            	</script>
            <%
            }else{
            %>
            	<script>
            		alert("Erro ao realizar a compra");
            		window.location.href = "../dashboard/dashboardvendas.jsp";
            	</script>
            <%
            }
        } catch (Exception e) {
            // Exiba uma mensagem de erro caso ocorra um problema ao comprar o livro
    %>
    <p style="color: #fff;">Ocorreu um erro ao comprar o livro.</p>
    <%
        }
    } else {
        // O atributo "nomeUsuario" não está na sessão
    %>
    <script type="text/javascript">
        alert("Realize login para realizar a compra");
        window.location.href = "../../index.html";
    </script>
    <%
    } // Fim do if (nomeUsuario != null)
} else {
    // Não há sessão existente
%>
<script type="text/javascript">
    alert("Faça login para realizar a compra");
    window.location.href = "../../index.html";
</script>
<%
}
%>
</body>
</html>
