package it.prova.ebayspringmvcsecurity.web.controller;

import it.prova.ebayspringmvcsecurity.service.categoria.CategoriaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {

    @Autowired
    private CategoriaService categoriaService;

    @RequestMapping(value = {"/home", ""})
    public String loginMessage(Model model) {
        model.addAttribute("categorie_list_attribute", categoriaService.listAllElements());
        return "open/index";
    }
}
