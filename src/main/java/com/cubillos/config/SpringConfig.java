package com.cubillos.config;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

@Configuration
public class SpringConfig extends WebSecurityConfigurerAdapter{
	@Autowired
	private DataSource dataSource;
	 
	@Autowired
	public void configureGlobal(AuthenticationManagerBuilder auth) 
	  throws Exception {
	    auth.jdbcAuthentication()
	      .dataSource(dataSource)
	      .usersByUsernameQuery("select email_user as email,password,state as enabled "
	        + "from users "
	        + "where email_user = ?")
	      .authoritiesByUsernameQuery("select email_user as email,role as authority "
	        + "from user_role "
	        + "where email_user = ?");
	}	
	
	@Override
    protected void configure(HttpSecurity httpSecurity) throws Exception {
		httpSecurity.authorizeRequests()
			.antMatchers("/assets/**").permitAll()
			.antMatchers("/register").permitAll()
			.antMatchers("/login*").permitAll()
			.antMatchers("/home").hasAnyRole("USER", "ADMIN")
			.antMatchers("/template").hasAnyRole("USER")
			.antMatchers("/database**").hasAnyRole("USER", "ADMIN")
			.antMatchers("/users**").hasAnyRole("ADMIN")
			.antMatchers("/profile**").hasAnyRole("USER", "ADMIN")
			.and()
			.formLogin()
	            .loginPage("/login")
	            .defaultSuccessUrl("/home")
	            .permitAll()
	        .and()
			.logout()
			.logoutUrl("/logout")
			.permitAll();
	
		httpSecurity.csrf().disable();
        
        
    }
	 
	@Bean
    public BCryptPasswordEncoder passwordEncoder() {
        BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder();
        return bCryptPasswordEncoder;
    }
}
