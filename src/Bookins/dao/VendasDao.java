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
            ResultSet rs = con.executeQuery("SELECT v.idVenda as id, u.usuario, l.nomeLivro as livro, l.preco_livro as preco\r\n"
            		+ "FROM usuario u\r\n"
            		+ "INNER JOIN Venda v ON u.idUsuario = v.idUsuario\r\n"
            		+ "INNER JOIN Livro l ON v.idLivro = l.idLivro;");
            while (rs.next()) {
                Venda venda = new Venda();
                venda.setIdVenda(rs.getInt("id"));
                venda.setUsuario(rs.getString("usuario"));
                venda.setNomeLivro(rs.getString("livro"));
                venda.setPrecoLivro(rs.getDouble("preco"));
                vendas.add(venda);
            }
        } finally {
            if (con != null) {
                con.fecharConexao();
            }
        }

        return vendas;
    }
}
