package it.prova.ebayspringmvcsecurity.web.controller;

import it.prova.ebayspringmvcsecurity.model.Acquisto;
import it.prova.ebayspringmvcsecurity.model.Annuncio;
import it.prova.ebayspringmvcsecurity.model.Utente;
import it.prova.ebayspringmvcsecurity.service.acquisto.AcquistoService;
import it.prova.ebayspringmvcsecurity.service.annuncio.AnnuncioService;
import it.prova.ebayspringmvcsecurity.service.utente.UtenteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.security.Principal;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping(value = "/acquisto")
public class AcquistiController {

    @Autowired
    private AnnuncioService annuncioService;

    @Autowired
    private UtenteService utenteService;

    @Autowired
    private AcquistoService acquistoService;

    @GetMapping("/dettaglio/{idAnnuncio}")
    public String showDettaglioAnnuncio(@PathVariable(required = true) Long idAnnuncio, Model model) {
        model.addAttribute("dettaglio_articolo_attr", annuncioService.caricaSingoloAnnuncioEager(idAnnuncio));

        return "acquisto/dettaglio";
    }

    @PostMapping("/listaAcquistiUtente/{idAnnuncio}")
    public String eseguiAcquisto(@PathVariable(required = true) Long idAnnuncio, Model model, Principal principal) {

        Utente utenteInSessione = utenteService.findByUsername(principal.getName());
        Annuncio annuncioConsiderato = annuncioService.caricaSingoloAnnuncioEager(idAnnuncio);

        //verifica se l'utente ha abbastanza soldi per effettuare l'acquisto
        if (utenteInSessione.getCreditoResiduo() - annuncioConsiderato.getPrezzo() < 0) {
            model.addAttribute("errorMessage", "Credito residuo non sufficiente,ricarica la carta per poter procedere all acquisto");
            return "acquisto/listaAcquistiUtente";
        }

        //sottraggo l'importo dal bean utente e lo aggiorno sul db
        utenteInSessione.setCreditoResiduo(utenteInSessione.getCreditoResiduo() - annuncioConsiderato.getPrezzo());
        utenteService.aggiorna(utenteInSessione);

        //chiudo annuncio e lo aggiorno sul db
        annuncioConsiderato.setStatoAnnuncio(false);
        annuncioService.aggiorna(annuncioConsiderato);

        //crea un nuovo acquisto e lo aggiungo al db
        Acquisto nuovoAcquisto = new Acquisto(annuncioConsiderato.getTestoAnnuncio(), annuncioConsiderato.getPrezzo(), new Date(), utenteInSessione);
        acquistoService.inserisciNuovo(nuovoAcquisto);

        //infine carico la lista degli acquisti dell'utente in sessione
        model.addAttribute("lista_acquisti_utente",acquistoService.findByUtente(utenteInSessione));
        model.addAttribute("utente_in_sessione",utenteInSessione);


        return "acquisto/listaAcquistiUtente";
    }


    //    @PostMapping("/update")
//    public String updateRegista(@Valid @ModelAttribute("edit_regista_attr") Regista regista, BindingResult result,
//                                RedirectAttributes redirectAttrs, HttpServletRequest request) {
//
//        if (result.hasErrors()) {
//            return "regista/edit";
//        }
//        registaService.aggiorna(regista);
//
//        redirectAttrs.addFlashAttribute("successMessage", "Operazione eseguita correttamente");
//        return "redirect:/regista";
//    }
}
