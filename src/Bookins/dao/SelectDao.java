package Bookins.dao;

import Bookins.model.Livro;
import Bookins.model.Venda;
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
    
    public List<Venda> listarMinhasCompras(Venda v) throws SQLException {
        Conexao con = null;
        
        List<Venda> vendas = new ArrayList<>();
        try {
            con = new Conexao();
            ResultSet rs = con.executeQuery("SELECT v.idVenda as id, u.usuario, l.nomeLivro as livro, l.preco_livro as preco, v.quantidade\r\n"
            		+ "FROM usuario u\r\n"
            		+ "INNER JOIN Venda v ON u.idUsuario = v.idUsuario\r\n"
            		+ "INNER JOIN Livro l ON v.idLivro = l.idLivro\r\n"
            		+ "WHERE u.usuario = '"+v.getUsuario()+"'\r\n"
            		+ "order by v.idVenda;");
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
