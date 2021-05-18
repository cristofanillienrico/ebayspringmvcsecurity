package it.prova.ebayspringmvcsecurity.repository.annuncio;

import it.prova.ebayspringmvcsecurity.model.Annuncio;

import java.util.List;

public interface CustomAnnuncioRepository {

    List<Annuncio> findByExample(Annuncio example);
}
