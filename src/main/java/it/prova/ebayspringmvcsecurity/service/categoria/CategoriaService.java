package it.prova.ebayspringmvcsecurity.service.categoria;


import it.prova.ebayspringmvcsecurity.model.Categoria;

import java.util.List;

public interface CategoriaService {
    public List<Categoria> listAllElements();

    public Categoria caricaSingoloElemento(Long id);

    //  public Acquisto caricaSingoloElementoEager(Long id);

    public void aggiorna(Categoria categoriaInstance);

    public void inserisciNuovo(Categoria categoriaInstance);

    public void rimuovi(Categoria categoriaInstance);

    //  public List<Acquisto> findByExample(Acquisto example);
}
