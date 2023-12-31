package Bookins.model;

public class Venda {
    private int idVenda;
    private String usuario;
    private String nomeLivro;
    private double precoLivro;
    private int idLivro;
    private int idUsuario;
    private double quantidade;

    // Construtores, getters e setters
    public Venda() {
    	
    }
    public Venda(int idVenda, String usuario, String nomeLivro, double precoLivro, int quantidade) {
        this.idVenda = idVenda;
        this.usuario = usuario;
        this.nomeLivro = nomeLivro;
        this.precoLivro = precoLivro;
        this.quantidade = quantidade;
    }

    // Getters e setters para os campos

    public int getIdVenda() {
        return idVenda;
    }

    public void setIdVenda(int idVenda) {
        this.idVenda = idVenda;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getNomeLivro() {
        return nomeLivro;
    }

    public void setNomeLivro(String nomeLivro) {
        this.nomeLivro = nomeLivro;
    }

    public double getPrecoLivro() {
        return precoLivro;
    }

    public void setPrecoLivro(double precoLivro) {
        this.precoLivro = precoLivro;
    }
    
	public int getIdLivro() {
		return idLivro;
	}
	public void setIdLivro(int idLivro) {
		this.idLivro = idLivro;
	}
	public double getQuantidade() {
		return quantidade;
	}
	
	public int getIdUsuario() {
		return idUsuario;
	}
	public void setIdUsuario(int idUsuario) {
		this.idUsuario = idUsuario;
	}
	public void setQuantidade(double quantidade) {
		this.quantidade = quantidade;
	}
    
}
