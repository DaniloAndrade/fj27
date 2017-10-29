package br.com.casadocodigo.loja.conf;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Profile;
import org.springframework.jdbc.datasource.DriverManagerDataSource;

import javax.sql.DataSource;
import java.util.Objects;

public class TestConfiguration {

	@Bean
	@Profile("test")
	public DataSource dataSource() {
		String dbuser = System.getProperty("dbuser","root");
		String dbpassword = System.getProperty("dbpassword", "devmysql");
		Objects.requireNonNull(dbuser, "dbuser não foi definido");
		Objects.requireNonNull(dbpassword, "dbpassword não foi definido");
		DriverManagerDataSource dataSource = new DriverManagerDataSource();
		dataSource.setDriverClassName("com.mysql.jdbc.Driver");
		dataSource.setUrl("jdbc:mysql://localhost:3306/casadocodigotest");
		dataSource.setUsername(dbuser);
		dataSource.setPassword(dbpassword);
		return dataSource;
	}
}
