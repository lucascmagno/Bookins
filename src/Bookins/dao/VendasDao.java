package Bookins.dao;
import Bookins.util.Conexao;
import Bookins.model.Venda;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class VendasDao {
	public List<Venda> listarVendas() throws SQLException {
        Conexao con = null;
        
        List<Venda> vendas = new ArrayList<>();
        try {
            con = new Conexao();
            ResultSet rs = con.executeQuery("SELECT v.idVenda as id, u.usuario, l.nomeLivro as livro, l.preco_livro as preco, v.quantidade\r\n"
            		+ "FROM usuario u\r\n"
            		+ "INNER JOIN Venda v ON u.idUsuario = v.idUsuario\r\n"
            		+ "INNER JOIN Livro l ON v.idLivro = l.idLivro;");
            while (rs.next()) {
                Venda venda = new Venda();
                venda.setIdVenda(rs.getInt("id"));
                venda.setUsuario(rs.getString("usuario"));
                venda.setNomeLivro(rs.getString("livro"));
                venda.setPrecoLivro(rs.getDouble("preco"));
                venda.setQuantidade(rs.getInt("quantidade"));
                vendas.add(venda);
            }
        } finally {
            if (con != null) {
                con.fecharConexao();
            }
        }

        return vendas;
    }
	
	public boolean inserirVenda(Venda v) {
			
			Conexao con = null;
			
			try {
				con = new Conexao();
				con.executeUpdate("INSERT INTO venda(idLivro, idUsuario, quantidade) VALUES("
						+ "'" + v.getIdLivro() + "','"
						+ v.getIdUsuario() + "','"
						+ v.getQuantidade() +"');");
				return true;
			}catch(SQLException e){
				return false;
			}
	}
	
	public int getIdUsuario(String usuario) {
	    Conexao con = null;

	    try {
	        con = new Conexao();
	        String query = "SELECT idUsuario FROM usuario WHERE usuario = '" + usuario + "'";
	        
	        ResultSet resultSet = con.executeQuery(query);
	        
	        if (resultSet.next()) {
	            // Se encontrar o usuário, obtenha o ID do resultado
	            int idUsuario = resultSet.getInt("idUsuario");
	            return idUsuario;
	        } else {
	            return 0; // Retorna 0 para indicar que o usuário não foi encontrado
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	        return 0;
	    } finally {
	        if (con != null) {
	            con.fecharConexao();
	        }
	    }
	}
}
