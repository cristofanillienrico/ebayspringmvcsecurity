package it.prova.ebayspringmvcsecurity.service.annuncio;


import it.prova.ebayspringmvcsecurity.model.Annuncio;
import it.prova.ebayspringmvcsecurity.model.Utente;

import java.util.List;

public interface AnnuncioService {
    public List<Annuncio> listAllElements();

    public Annuncio caricaSingoloElemento(Long id);


    public void aggiorna(Annuncio annuncioInstance);

    public void inserisciNuovo(Annuncio annuncioInstance);

    public void rimuovi(Annuncio annuncioInstance);

    List<Annuncio> findByExample(Annuncio annuncioExample);

    Annuncio caricaSingoloAnnuncioEager(Long idAnnuncio);

    List<Annuncio> findAllByUtente(Utente utente);
}
