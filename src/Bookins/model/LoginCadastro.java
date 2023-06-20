package Bookins.model;

public class LoginCadastro {
	private String email;
	private String usuario;
	private String senha;
	
	public LoginCadastro() {
	}
	public LoginCadastro(String usuario, String senha) {
		this.usuario = usuario;
		this.senha = senha;
	}
	
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getUsuario() {
		return usuario;
	}

	public void setUsuario(String usuario) {
		this.usuario = usuario;
	}

	public String getSenha() {
		return senha;
	}

	public void setSenha(String senha) {
		this.senha = senha;
	}
	
}
