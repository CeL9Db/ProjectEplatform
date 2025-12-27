package com.lanzzStore.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
public class Securitycfg 
{
	@Bean
	public PasswordEncoder passwordCrypt()
	{
		return new BCryptPasswordEncoder();
	}
	
	@Bean SecurityFilterChain filter(HttpSecurity http) throws Exception
	{
		http
			.authorizeHttpRequests(auth -> auth.anyRequest().permitAll())	// tous ont access
			// desactive protection standart pour: form, standart form login, standart form logout ::respectivement::
			.csrf(csrf -> csrf.disable())
			.formLogin(form -> form.disable())
			.logout(logout -> logout.disable());
		return http.build();
	}
}
