package br.com.casadocodigo.loja.models;

import org.springframework.security.core.GrantedAuthority;


public enum  Role implements GrantedAuthority {
	ROLE_COMPRADOR, ROLE_ADMIN;

	@Override
	public String getAuthority() {
		return this.name();
	}
}
