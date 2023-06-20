package Bookins.dao;

import Bookins.model.Estoque;
import Bookins.util.Conexao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class EstoqueDao {
	public List<Estoque> listarEstoque() throws SQLException {
        Conexao con = null;
        
        List<Estoque> estoque = new ArrayList<>();
        try {
            con = new Conexao();
            ResultSet rs = con.executeQuery("SELECT livro.idLivro as id,\r\n"
            		+ " livro.nomeLivro as nome,\r\n"
            		+ " livro.descricao_livro as descricao,\r\n"
            		+ " livro.preco_livro as preço,\r\n"
            		+ " estoque.quantidade,\r\n"
            		+ " estoque.total\r\n"
            		+ "from livro, estoque\r\n"
            		+ ";");
            while (rs.next()) {
                Estoque estoque1 = new Estoque();
                estoque1.setId(rs.getInt("id"));
                estoque1.setNome(rs.getString("nome"));
                estoque1.setDescricao(rs.getString("descricao"));
                estoque1.setQuantidade(rs.getInt("quantidade"));
                estoque1.setPreco(rs.getDouble("preco"));
                estoque1.setTotal(rs.getDouble("total"));
                
                estoque.add(estoque1);
            }
        } finally {
            if (con != null) {
                con.fecharConexao();
            }
        }

        return estoque;
    }
}
