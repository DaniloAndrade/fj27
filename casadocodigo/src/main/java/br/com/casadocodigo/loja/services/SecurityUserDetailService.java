package br.com.casadocodigo.loja.services;

import br.com.casadocodigo.loja.daos.UserDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import javax.persistence.NoResultException;


@Service
public class SecurityUserDetailService implements UserDetailsService {

	@Autowired
	private UserDAO dao;

	@Override
	public UserDetails loadUserByUsername(String userName) throws UsernameNotFoundException {
		try {
			return dao.findByUserName(userName);
		}catch (NoResultException e){
			throw new UsernameNotFoundException("Não encontramos o usuario", e);
		}
	}
}
