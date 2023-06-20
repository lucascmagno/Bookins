package Bookins.dao;

import java.sql.SQLException;

import Bookins.model.Livro;
import Bookins.model.LoginCadastro;
//Conexao
import Bookins.util.Conexao;

public class CadastroDao {

	public boolean inserirUsuario(LoginCadastro c) {
		
		Conexao con = null;
		
		try {
			con = new Conexao();
			con.executeUpdate("INSERT INTO usuario(email, usuario, senha) VALUES ("
					+ "'" + c.getEmail() + "','"
					+ c.getUsuario() + "','"
					+ c.getSenha() +"');");
			return true;
		}catch(SQLException e){
			return false;
		}
	}
	
	public boolean inserirLivro(Livro l) {
		
		Conexao con = null;
		
		try {
			con = new Conexao();
			con.executeUpdate("INSERT INTO livro(nomeLivro, descricao_livro, preco_livro) VALUES("
					+ "'" + l.getTitulo() + "','"
					+ l.getDescricao() + "','"
					+ l.getPreco() +"');");
			return true;
		}catch(SQLException e){
			return false;
		}
	}
	
	public boolean updateLivro(Livro l) {
		Conexao con = null;
		
		try {
			con = new Conexao();
			con.executeUpdate("UPDATE livro SET nomeLivro='"+l.getTitulo()+"', descricao_livro='"+l.getDescricao()+"', preco_livro='"+l.getPreco()+"' "
	                + "WHERE idLivro="+l.getId()+";");
			return true;
		}catch(SQLException e){
			return false;
		}
	}
	public boolean deleteLivro(Livro l) {
		Conexao con = null;
		
		try {
			con = new Conexao();
			con.executeUpdate("DELETE FROM livro WHERE idLivro="+l.getId());
			return true;
		}catch(SQLException e){
			return false;
		}
	}
}
