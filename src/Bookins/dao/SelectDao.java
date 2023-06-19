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
	 private Connection conexao; // A conex�o com o banco de dados

	    // Construtor que recebe a conex�o com o banco de dados
	    public SelectDao(Connection conexao) {
	        this.conexao = conexao;
	    }
	    
    public List<Livro> listarLivros() throws SQLException {
        List<Livro> livros = new ArrayList<>();
        
        //Conexao con = null;
        // Cria a consulta SQL
        String sql = "SELECT * FROM livro";

        try (Statement stmt = conexao.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
        	//con = new Conexao();
            // Processa o resultado
            while (rs.next()) {
                // Crie uma inst�ncia de Livro e preencha os dados
                Livro livro = new Livro();
                livro.setId(rs.getInt("id"));
                livro.setTitulo(rs.getString("titulo"));
                livro.setDescricao(rs.getString("descricao"));
                livro.setPreco(rs.getDouble("preco"));
                // Adicione o livro � lista
                livros.add(livro);
            }
        }

        return livros;
    }
}
