package br.com.casadocodigo.loja.validators;

import br.com.casadocodigo.loja.models.Product;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

public class ProductValidator implements Validator {


	public static final Class<Product> PRODUCT_CLASS = Product.class;

	@Override
	public boolean supports(Class<?> aClass) {
		return PRODUCT_CLASS.isAssignableFrom(aClass);
	}

	@Override
	public void validate(Object o, Errors errors) {
		Product product = PRODUCT_CLASS.cast(o);
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "title", "field.required","Titulo é obrigatorio");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "description", "field.required", "Descrição é obrigatório");
		if (product.getNumberOfPages() < 1){
			errors.rejectValue("numberOfPages","field.required", "Numero de pagina é obrigatório");
		}

	}
}
