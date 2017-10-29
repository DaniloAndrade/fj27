package br.com.casadocodigo.loja.daos;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

import br.com.casadocodigo.loja.models.BookType;
import org.springframework.stereotype.Repository;

import br.com.casadocodigo.loja.models.Product;

import java.math.BigDecimal;
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

	public Product findById(Integer id) {
		TypedQuery<Product> query = em.createQuery("select distinct p from Product p join fetch p.prices " +
				"where p.id = :id", Product.class);
		query.setParameter("id", id);
		return query.getSingleResult();
	}

	public BigDecimal sumPricesPerType(BookType bookType) {
		TypedQuery<BigDecimal> query = em.createQuery("select sum(price.value) from Product p " +
				"join p.prices price where price.bookType = :bookType", BigDecimal.class);
		query.setParameter("bookType", bookType);
		return query.getSingleResult();
	}
}
