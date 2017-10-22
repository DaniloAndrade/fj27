package br.com.casadocodigo.loja.conf;

import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

import javax.servlet.MultipartConfigElement;
import javax.servlet.ServletRegistration;

public class ServletSpringMVC extends AbstractAnnotationConfigDispatcherServletInitializer {

	@Override
	protected Class<?>[] getRootConfigClasses() {
		// TODO Auto-generated method stub
		return new Class[]{
				SecurityConfiguration.class,
				AppWebConfiguration.class,
				JPAConfiguration.class
		};
	}

	@Override
	protected Class<?>[] getServletConfigClasses() {
		return new Class[]{};
	}

	@Override
	protected void customizeRegistration(ServletRegistration.Dynamic registration) {
		super.customizeRegistration(registration);
		registration.setMultipartConfig(new MultipartConfigElement(""));
	}

	@Override
	protected String[] getServletMappings() {
		return new String[]{"/"};
	}

}
