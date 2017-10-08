package br.com.casadocodigo.loja.controllers;

import br.com.casadocodigo.loja.validators.ProductValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import br.com.casadocodigo.loja.daos.ProductDAO;
import br.com.casadocodigo.loja.models.BookType;
import br.com.casadocodigo.loja.models.Product;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;
import java.util.List;

@Controller
@RequestMapping("/produtos")
public class ProdutoController {
	
	@Autowired
	private ProductDAO productDAO;

	@Transactional
	@RequestMapping(method=RequestMethod.POST, name = "productSave")
	public ModelAndView adicionar(@Valid Product product, BindingResult bindingResult, RedirectAttributes attributes) {
		if (bindingResult.hasErrors()){
			return form(product);
		}

		System.out.println("Cadastrando o produto:" + product);
		productDAO.save(product);
		attributes.addFlashAttribute("msg", "Produto cadastrado com sucesso!");
		return new ModelAndView("redirect:produtos");
	}
	
	@RequestMapping(value="/form", method = RequestMethod.GET)
	public ModelAndView form(Product product){
		ModelAndView modelAndView = new ModelAndView("produto/form");
		modelAndView.addObject("types", BookType.values());
		return modelAndView;
	}


	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView products(){
		ModelAndView modelAndView = new ModelAndView("produto/list");
		List<Product> products = productDAO.listAll();
		modelAndView.addObject("products", products);
		return modelAndView;
	}

	@InitBinder
	public void initBinder(WebDataBinder dataBinder){
		dataBinder.addValidators(new ProductValidator());
	}
}
