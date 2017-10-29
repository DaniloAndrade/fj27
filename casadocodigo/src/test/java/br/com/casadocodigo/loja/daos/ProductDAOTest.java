package br.com.casadocodigo.loja.daos;


import br.com.casadocodigo.loja.builders.ProductBuilder;
import br.com.casadocodigo.loja.conf.JPAConfiguration;
import br.com.casadocodigo.loja.conf.TestConfiguration;
import br.com.casadocodigo.loja.models.BookType;
import br.com.casadocodigo.loja.models.Product;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Profile;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.transaction.Transactional;
import java.math.BigDecimal;
import java.util.List;

import static br.com.casadocodigo.loja.builders.ProductBuilder.*;
import static org.junit.Assert.assertEquals;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = {ProductDAO.class, JPAConfiguration.class, TestConfiguration.class})
@ActiveProfiles("test")
public class ProductDAOTest {

	@Autowired
	private ProductDAO dao;


	@Test
	@Transactional
	public void shouldSumAllPricesofEachBookPerType(){

		List<Product> printedBooks = newProduct(BookType.PRINTED, BigDecimal.TEN).more(4).buildAll();
		printedBooks.forEach(dao::save);

		List<Product> ebooks = newProduct(BookType.EBOOK, BigDecimal.TEN).more(4).buildAll();
		ebooks.forEach(dao::save);

		BigDecimal value = dao.sumPricesPerType(BookType.PRINTED);

		assertEquals(new BigDecimal(50).setScale(2), value);
	}
}
