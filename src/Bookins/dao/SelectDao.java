package Bookins.dao;

import Bookins.model.Livro;
import Bookins.util.Conexao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class SelectDao {
    
    public List<Livro> listarLivros() throws SQLException {
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
    
    public Livro getLivroById(int id) throws SQLException {
        Conexao con = null;
        Livro livro = null;

        try {
            con = new Conexao();
            ResultSet rs = con.executeQuery("SELECT * FROM livro WHERE idLivro=" + id);
            
            if (rs.next()) {
                livro = new Livro();
                livro.setId(rs.getInt("idLivro"));
                livro.setTitulo(rs.getString("nomeLivro"));
                livro.setDescricao(rs.getString("descricao_livro"));
                livro.setPreco(rs.getDouble("preco_livro"));
            }
        } finally {
            if (con != null) {
                con.fecharConexao();
            }
        }

        return livro;
    }
}
