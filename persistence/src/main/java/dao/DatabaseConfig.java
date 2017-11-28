package dao;

import java.io.IOException;
import java.util.Properties;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.orm.hibernate4.LocalSessionFactoryBean;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;

@Configuration
@PropertySource("/datasource.properties")
public class DatabaseConfig {
	
	@Value("${jdbcUrl}")
	private String jdbcUrl;
	
	@Value("${driverClassName}")
	private String driverClassName;
	
	@Value("${dataSource.user}")
	private String user;
	
	@Value("${dataSource.password}")
	private String password;
	
	@Bean
	public HikariDataSource getDataSource() {
		HikariConfig config = new HikariConfig();
		config.setJdbcUrl(jdbcUrl);
		config.setDriverClassName(driverClassName);
		config.setUsername(user);
		config.setPassword(password);
		return new HikariDataSource(config);
	}
	
	private Properties hibernateProperties() {
		Properties prop = new Properties();
		try {
			prop.load(Thread.currentThread().getContextClassLoader().getResourceAsStream("/hibernate.properties"));
		} catch(IOException e) {
			e.printStackTrace();
		}
		return prop;
	}
	
	@Bean
	public LocalSessionFactoryBean sessionFactory() {
		LocalSessionFactoryBean sessionFactory = new LocalSessionFactoryBean();
		sessionFactory.setDataSource(getDataSource());
		sessionFactory.setPackagesToScan(new String[] {"model"});
		sessionFactory.setHibernateProperties(hibernateProperties());
		return sessionFactory;
	}
	
}