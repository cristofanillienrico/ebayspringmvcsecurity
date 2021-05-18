package it.prova.ebayspringmvcsecurity.web.controller;


import it.prova.ebayspringmvcsecurity.model.Annuncio;
import it.prova.ebayspringmvcsecurity.service.annuncio.AnnuncioService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping(value = "/open")
public class OpenAnnunciController {

    @Autowired
    private AnnuncioService annuncioService;

    @RequestMapping(value = "/list", method = {RequestMethod.GET, RequestMethod.POST})
    public String ricercaAnnunci(Annuncio annuncioExample, ModelMap model) {
        List<Annuncio> utenti = annuncioService.findByExample(annuncioExample);
        model.addAttribute("annunci_list_attribute", utenti);
        return "open/list";
    }

    @GetMapping("/show/{idAnnuncio}")
    public String showAnnuncio(@PathVariable(required = true) Long idAnnuncio, Model model) {
        model.addAttribute("dettaglio_articolo_attr", annuncioService.caricaSingoloAnnuncioEager(idAnnuncio));

        return "open/show";
    }



}
