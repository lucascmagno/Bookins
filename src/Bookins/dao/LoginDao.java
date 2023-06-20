package Bookins.dao;

import Bookins.model.LoginCadastro;
//Conexao
import Bookins.util.Conexao;
import java.sql.SQLException;
import java.sql.ResultSet;

public class LoginDao {
	public LoginCadastro login (String usuario, String senha) {
		Conexao con = null;
		try {
			con = new Conexao();
			ResultSet rs = con.executeQuery("SELECT * FROM usuario WHERE usuario = '"+usuario+"' AND senha='"+senha+"';");
			System.out.println("Sucesso no Login");
			if(rs.next()) {
				return new LoginCadastro(
					rs.getString("usuario"),
					rs.getString("senha")
				);
			}else {
				return null;
			}
		}catch(SQLException e){
			System.out.println("erro ao ler os dados da tabela");
			return null;
		}
	}
}
