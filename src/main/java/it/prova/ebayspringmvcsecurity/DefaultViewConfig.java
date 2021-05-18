package it.prova.ebayspringmvcsecurity;

import org.springframework.core.Ordered;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

public class DefaultViewConfig implements WebMvcConfigurer {
    @Override
    public void addViewControllers(ViewControllerRegistry registry) {
        registry.addViewController("/").setViewName("/open/index");
        registry.setOrder(Ordered.HIGHEST_PRECEDENCE);
    }
}