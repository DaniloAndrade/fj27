package br.com.casadocodigo.loja.controllers;

import br.com.casadocodigo.loja.utils.Message;
import br.com.casadocodigo.loja.validators.ProductValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
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

	@Autowired
	private FileSaver fileSaver;

	@Transactional
	@CacheEvict(value = "productList", allEntries = true)
	@RequestMapping(method=RequestMethod.POST, name = "productSave")
	public ModelAndView adicionar(MultipartFile summary, @Valid Product product, BindingResult bindingResult, RedirectAttributes attributes) {
		if (bindingResult.hasErrors()){
			return form(product);
		}

		String wepPath = fileSaver.write("uploaded-summaries", summary);
		product.setSummaryPath(wepPath);

		System.out.println("Cadastrando o produto:" + product);
		productDAO.save(product);
		attributes.addFlashAttribute("msg", new Message("Sucesso!", "Produto cadastrado com sucesso!"));
		return new ModelAndView("redirect:produtos");
	}

	@RequestMapping(value="/form", method = RequestMethod.GET, name = "produtoFormulario")
	public ModelAndView form(Product product){
		ModelAndView modelAndView = new ModelAndView("produto/form");
		modelAndView.addObject("types", BookType.values());
		return modelAndView;
	}


	@Cacheable(value = "productList")
	@RequestMapping(method = RequestMethod.GET, name = "produtoList")
	public ModelAndView products(){
		ModelAndView modelAndView = new ModelAndView("produto/list");
		List<Product> products = productDAO.listAll();
		modelAndView.addObject("products", products);
		return modelAndView;
	}

	@RequestMapping(method = RequestMethod.GET, value = "/{id}" , name = "visualizarProduto")
	public ModelAndView show(@PathVariable("id") Integer id){
		ModelAndView modelAndView = new ModelAndView("produto/show");
		modelAndView.addObject("product", productDAO.findById(id));
		return modelAndView;
	}

	//@InitBinder
	public void initBinder(WebDataBinder dataBinder){
		dataBinder.addValidators(new ProductValidator());
	}
}
