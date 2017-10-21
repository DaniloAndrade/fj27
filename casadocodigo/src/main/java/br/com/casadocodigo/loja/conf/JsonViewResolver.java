package br.com.casadocodigo.loja.conf;

import org.springframework.web.servlet.View;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

import java.util.Locale;

public class JsonViewResolver implements ViewResolver {


	@Override
	public View resolveViewName(String s, Locale locale) throws Exception {
		MappingJackson2JsonView view = new MappingJackson2JsonView();
		view.setPrefixJson(true);
//		view.setModelKey("products");
		view.setPrefixJson(false);
		return view;
	}
}
