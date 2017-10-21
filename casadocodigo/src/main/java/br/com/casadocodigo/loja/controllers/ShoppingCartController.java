package br.com.casadocodigo.loja.controllers;

import br.com.casadocodigo.loja.daos.ProductDAO;
import br.com.casadocodigo.loja.models.*;
import br.com.casadocodigo.loja.services.ProcessaPagamentoService;
import br.com.casadocodigo.loja.utils.Message;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.math.BigDecimal;
import java.util.concurrent.Callable;

@Controller
@RequestMapping("shopping")
public class ShoppingCartController {

	@Autowired
	private ProductDAO productDAO;

	@Autowired
	private ShoppingCart shoppingCart;

	@Autowired
	private ProcessaPagamentoService pagamentoService;

	@RequestMapping(method = RequestMethod.POST)
	public ModelAndView add(Integer productId, @RequestParam BookType bookType){
		ShoppingItem item = createItem(productId, bookType);
		shoppingCart.add(item);
		return new ModelAndView("redirect:/produtos");
	}

	private ShoppingItem createItem(Integer productId, BookType bookType) {
		Product product = productDAO.findById(productId);
		ShoppingItem item = new ShoppingItem(product, bookType);
		return item;
	}

	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView items(){
		return new ModelAndView("shopping/items");
	}

	@RequestMapping(method = RequestMethod.POST, value = "/checkout")
	public Callable<String> checkout(RedirectAttributes redirectAttributes){
		BigDecimal total = shoppingCart.getTotal();
		return () -> pagamentoService.processar(new PaymentData(total),
				(rs) -> {
					redirectAttributes.addFlashAttribute("msg", new Message("Sucesso!", rs));
					return "redirect:/produtos";
				},
				(rs) -> {
					redirectAttributes.addFlashAttribute("error", new Message("Falhou!", "Houve um problema no pagamento: " + rs));
					return "redirect:/shopping";
				});
	}
}
