package Bookins.dao;

import Bookins.model.Livro;
//Conexao
import Bookins.util.Conexao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class SelectDao {
	private Connection conexao;

    public SelectDao(Connection conexao) {
        this.conexao = conexao;
    }

    public Connection getConexao() {
		return conexao;
	}

	public List<Livro> listarLivros() throws SQLException {
        List<Livro> livros = new ArrayList<>();
        
        try (Statement stmt = conexao.createStatement();
             ResultSet rs = stmt.executeQuery("SELECT * FROM livro")) {
            while (rs.next()) {
                Livro livro = new Livro();
                livro.setId(rs.getInt("id"));
                livro.setTitulo(rs.getString("titulo"));
                livro.setDescricao(rs.getString("descricao"));
                livro.setPreco(rs.getDouble("preco"));
                livros.add(livro);
            }
        }

        return livros;
    }
}
