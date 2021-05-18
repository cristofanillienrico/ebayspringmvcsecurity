package it.prova.ebayspringmvcsecurity.service.acquisto;

import it.prova.ebayspringmvcsecurity.model.Acquisto;
import it.prova.ebayspringmvcsecurity.model.Utente;

import java.util.List;

public interface AcquistoService {
    public List<Acquisto> listAllElements();

    public Acquisto caricaSingoloElemento(Long id);

    //  public Acquisto caricaSingoloElementoEager(Long id);

    public void aggiorna(Acquisto acquistoInstance);

    public void inserisciNuovo(Acquisto acquistoInstance);

    public void rimuovi(Acquisto acquistoInstance);

    //  public List<Acquisto> findByExample(Acquisto example);

    List<Acquisto> findByUtente(Utente utente);
}
