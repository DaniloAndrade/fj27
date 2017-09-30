package br.com.casadocodigo.loja.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import br.com.casadocodigo.loja.daos.ProductDAO;
import br.com.casadocodigo.loja.models.BookType;
import br.com.casadocodigo.loja.models.Product;

@Controller

public class ProdutoController {
	
	@Autowired
	private ProductDAO productDAO;

	@Transactional
	@RequestMapping(value="/produto", method=RequestMethod.POST)
	public String adicionar(Product product) {
		System.out.println("Cadastrando o produto:" + product);
		productDAO.save(product);
		return "produto/ok";
	}
	
	@RequestMapping(value="/produto", method = RequestMethod.GET)
	public ModelAndView form(){
		ModelAndView modelAndView = new ModelAndView("produto/form");
		modelAndView.addObject("types", BookType.values());
		return modelAndView;
	}
}
