package br.com.casadocodigo.loja.daos;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import org.springframework.stereotype.Repository;

import br.com.casadocodigo.loja.models.Product;

import java.util.List;

@Repository
public class ProductDAO {

	@PersistenceContext
	private EntityManager em;
	
	
	public void save(Product product){
		em.persist(product);
	}

	public List<Product> listAll() {
		TypedQuery<Product> query = em
				.createQuery("SELECT distinct p from Product p join fetch p.prices", Product.class);
		return query.getResultList();
	}
}
