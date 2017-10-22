package br.com.casadocodigo.loja.conf;

import br.com.casadocodigo.loja.services.SecurityUserDetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.annotation.web.servlet.configuration.EnableWebMvcSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

//@EnableWebSecurity
@EnableWebMvcSecurity
public class SecurityConfiguration extends WebSecurityConfigurerAdapter{

	@Autowired
	private SecurityUserDetailService service;

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.authorizeRequests()
				.antMatchers("/produtos/form").hasAnyRole("ADMIN")
				.antMatchers(HttpMethod.POST,"/produtos").hasAnyRole("ADMIN")
				.antMatchers("/produtos/**").permitAll()
				.antMatchers("/shopping/**").permitAll()
				.antMatchers("/resources/**").permitAll()
				.anyRequest().authenticated()
				.and().formLogin();
	}

	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth.userDetailsService(service).passwordEncoder(new BCryptPasswordEncoder());
	}
}
