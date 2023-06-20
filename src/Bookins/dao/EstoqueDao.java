package Bookins.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.sql.ResultSet;
import Bookins.model.Estoque;
import Bookins.model.Livro;
import Bookins.util.Conexao;

public class EstoqueDao {
public boolean inserirEstoque(Estoque s) {
		
		Conexao con = null;
		
		try {
			con = new Conexao();
			con.executeUpdate("INSERT INTO estoque(id, nome, quantidade, preco, total) VALUES ("
					+ "'" + s.getId() + "','"
					+ s.getNome() + "','"
					+ s.getQuantidade() + "','"
					+ s.getPreco() + "','"
					+ s.getTotal() +"');");
			con.fecharConexao();
			return true;
		}catch(SQLException e){
			return false;
		}
	}
public void DeleteEstoque(int id) {
	Conexao con = null; 
	try {
		con = new Conexao(); 
		con.executeUpdate("DELETE FROM estoque WHERE id=" + id);
		con.fecharConexao();
	} catch(SQLException e) {
		System.out.println("Falha ao apagar.");
	}
 }
public ResultSet ExecuteQuery(Estoque s) {
	Conexao con = null;
	try {
			
			con = new Conexao();
			ResultSet rs = con.executeQuery("SELECT * FROM estoque(id, nome, quantidade, preco, total) WHERE idlivro = " + s.getId() + ";");
			
			con.fecharConexao();
			
			return rs;
	} catch(SQLException e1) {
		return null; 
	}
}

/*
public List<Livro> listarEstoque() throws SQLException {
    Conexao con = null;
    
    List<Livro> livros = new ArrayList<>();
    try {
        con = new Conexao();
        ResultSet rs = con.executeQuery("SELECT * FROM livro;");
        while (rs.next()) {
            Livro livro = new Livro();
            livro.setId(rs.getInt("idLivro"));
            livro.setTitulo(rs.getString("nomeLivro"));
            livro.setDescricao(rs.getString("descricao_livro"));
            livro.setPreco(rs.getDouble("preco_livro"));
            livros.add(livro);
        }
    } finally {
        if (con != null) {
            con.fecharConexao();
        }
    }

    return livros;
}
*/

public boolean UpdateEstoque(String id, Estoque s) {
	Conexao con = null; 
	try {
		con = new Conexao(); 
		con.executeUpdate("UPDATE estoque SET"
					+ "'nome' = " + s.getId() + ","
					+ "'email' = " + s.getNome() + ","
		 			+ "'senha' = " + s.getQuantidade() + ","
					+ "'sexo' = " + s.getPreco() + ","
					+ "'telefone' = " + s.getTotal() + ";");
		con.fecharConexao();
		return true; 
	} catch(SQLException e) {
		return false; 
	}
}
}