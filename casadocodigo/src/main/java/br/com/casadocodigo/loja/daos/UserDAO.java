package br.com.casadocodigo.loja.daos;

import br.com.casadocodigo.loja.models.User;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

@Repository
public class UserDAO {

	@PersistenceContext
	private EntityManager em;

	public User findByUserName(String userName){
		TypedQuery<User> query = em.createQuery("select u from User u where u.login = :userName", User.class);
		query.setParameter("userName", userName);
		return query.getSingleResult();
	}
}
