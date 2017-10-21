package br.com.casadocodigo.loja.utils;

public class Message {
	private String titulo;
	private String detalhe;

	public Message(String titulo, String detalhe) {
		this.titulo = titulo;
		this.detalhe = detalhe;
	}

	public String getTitulo() {
		return titulo;
	}

	public String getDetalhe() {
		return detalhe;
	}
}
