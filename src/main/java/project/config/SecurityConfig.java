package project.config;


import org.springframework.security.authentication.AuthenticationProvider;
import jakarta.servlet.http.HttpServletRequest;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.authentication.configuration.AuthenticationConfiguration;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;

import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;
import project.service.CustomUserDetailService;

import java.util.Collection;
import java.util.Objects;

@Configuration
@EnableWebSecurity
@RequiredArgsConstructor
@EnableGlobalMethodSecurity(prePostEnabled = true)
public class SecurityConfig {

    private final JwtAuthenticationFilter jwtAuthenticationFilter;

    @Bean
    public UserDetailsService userDetailsService() {
        return new CustomUserDetailService();
    }

    @Bean
    public AuthenticationProvider authenticationProvider() {
        DaoAuthenticationProvider daoAuthenticationProvider = new DaoAuthenticationProvider();
        daoAuthenticationProvider.setPasswordEncoder(passwordEncoder());
        daoAuthenticationProvider.setUserDetailsService(userDetailsService());
        return daoAuthenticationProvider;
    }
    @Bean
    public AuthenticationManager authenticationManager(AuthenticationConfiguration configuration) throws Exception {
        return configuration.getAuthenticationManager();
    }


    @Bean
    BCryptPasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Bean
    SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
        http.
                authorizeRequests((auth) -> auth
                        .requestMatchers(new AntPathRequestMatcher("/")).permitAll()
                )

                .formLogin(login -> login
                        .loginPage("/admin/login")
                        .loginProcessingUrl("/login")
                        .usernameParameter("username")
                        .passwordParameter("password")

                        .failureHandler((request, response, exception) -> {
                            String paramValue = request.getParameter("url");
                            if(Objects.equals(paramValue, "/login")){
                                response.sendRedirect("/login?success=fail");
                            } else if (Objects.equals(paramValue, "/admin/login")) {
                                response.sendRedirect("/admin/login?success=fail");
                            }else {
                                response.sendRedirect("/login?success=fail");
                            }
                        })

                        .successHandler((request, response, authentication) -> {
                            String paramValue = request.getParameter("url");
                            if(Objects.equals(paramValue, "/login")){
                                response.sendRedirect("/");
                            } else if (Objects.equals(paramValue, "/admin/login")) {
                                response.sendRedirect("/admin");
                            }else {
                                response.sendRedirect(paramValue);
                            }
                        })
                )

                .logout(logout -> logout
                        .logoutUrl("/logout")
                        .logoutSuccessHandler((request, response, authentication) -> {
                            String paramValue = request.getParameter("url");
                            if (paramValue.startsWith("/info-account")){
                                response.sendRedirect("/");
                            }else {
                                response.sendRedirect(paramValue);
                            }

                        })
                        .invalidateHttpSession(true)
                        .deleteCookies("JSESSIONID")
                )
//                .sessionManagement(
//                        sessionManager -> sessionManager.sessionCreationPolicy(SessionCreationPolicy.STATELESS))
//                .authenticationProvider(authenticationProvider())
                .addFilterBefore(jwtAuthenticationFilter, UsernamePasswordAuthenticationFilter.class)
                ;

        return http.build();
    }
}



