package br.com.casadocodigo.loja.conf;

import br.com.casadocodigo.loja.services.SecurityUserDetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.annotation.web.servlet.configuration.EnableWebMvcSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

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
				.antMatchers("/home").permitAll()
//				.antMatchers("/resources/**").permitAll()
				.anyRequest().authenticated()
				.and()
					.formLogin()
					.defaultSuccessUrl("/produtos")
					.loginPage("/login")
					.permitAll()
				.and()
					.logout()
					.logoutRequestMatcher(new AntPathRequestMatcher("/logout"))
					.logoutSuccessUrl("/login")
					.permitAll()
				.and()
					.exceptionHandling()
					.accessDeniedPage("/403");
	}

	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth.userDetailsService(service).passwordEncoder(new BCryptPasswordEncoder());
	}

	@Override
	public void configure(WebSecurity web) throws Exception {
		web.ignoring().antMatchers("/resources/**");
	}
}
