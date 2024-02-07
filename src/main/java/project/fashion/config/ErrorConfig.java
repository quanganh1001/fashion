package project.fashion.config;

import org.springframework.boot.web.server.ErrorPage;
import org.springframework.boot.web.server.ErrorPageRegistrar;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpStatus;

@Configuration
public class ErrorConfig {

    @Bean
    public ErrorPageRegistrar errorPageRegistrar() {
        return registry -> {
            registry.addErrorPages(new ErrorPage(HttpStatus.NOT_FOUND, "/error-404"),
                                    new ErrorPage(HttpStatus.BAD_REQUEST, "/error-400"),
                                    new ErrorPage(HttpStatus.BAD_REQUEST, "/error-500"));
        };
    }
}
