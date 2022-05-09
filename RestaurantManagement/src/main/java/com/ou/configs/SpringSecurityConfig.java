package com.ou.configs;


import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.ou.configs.handlers.LoginSuccessHandler;
import com.ou.configs.handlers.LogoutHandler;
import com.ou.configs.handlers.MyAccessDeniedHandler;
import com.ou.utils.MomoUtil;
import com.ou.utils.TwilioUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.authentication.logout.LogoutSuccessHandler;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@Configuration
@EnableWebSecurity
@EnableTransactionManagement
@ComponentScan(basePackages = { 
    "com.ou.repository",
    "com.ou.services"
})
public class SpringSecurityConfig extends WebSecurityConfigurerAdapter {
    @Autowired
    private UserDetailsService userDetailsService;
    @Autowired
    private AuthenticationSuccessHandler loginSuccessHandler;
    @Autowired
    private LogoutSuccessHandler logoutHandler;

    @Autowired
    private MyAccessDeniedHandler accessDenied;
    @Bean
    public BCryptPasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }
    @Bean
    public Cloudinary cloudinary(){
        Cloudinary c = new Cloudinary(ObjectUtils.asMap(
                "cloud_name", "dqifjhxxg" ,
                "api_key", "785733736631163",
                "api_secret", "S6q88hiFzmq88oGl79I18fCZ608",
                "secure", true      
        ));
        return c;
    }
    @Bean
    public MomoUtil momoUtil() {
        return new MomoUtil();
    }
    
    @Bean
    public TwilioUtil twilioUtil() {
        return new TwilioUtil();
    }


    @Bean
    public AuthenticationSuccessHandler loginSuccessHandler() {
        return new LoginSuccessHandler();
    }
    
    @Bean
    public LogoutSuccessHandler logoutHandler() {
        return new LogoutHandler();
    }
    
    @Bean
    public MyAccessDeniedHandler accessDenied() {
        return new MyAccessDeniedHandler();
    }
    
    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(userDetailsService).passwordEncoder(passwordEncoder());
    }
    
    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.formLogin().loginPage("/sign-in")
                .usernameParameter("userUsename")
                .passwordParameter("userPassword");
        
        http.formLogin().defaultSuccessUrl("/").failureUrl("/sign-in?error");
        http.formLogin().successHandler(this.loginSuccessHandler);
        http.logout().logoutSuccessHandler(this.logoutHandler);
        http.exceptionHandling().accessDeniedPage("/sign-in?accessDenied");
        http.authorizeRequests().antMatchers("/").permitAll()
                .antMatchers("/admin/**").hasAuthority("ADMIN");
         http.authorizeRequests()
                .antMatchers("/order/**").hasAuthority("STAFF");
         http.authorizeRequests()
                .antMatchers("/user-order/**").hasAuthority("USER");
         http.authorizeRequests()
                .antMatchers("/payment").hasAnyAuthority("USER", "STAFF");
        
        http.csrf().disable();
    }
}
