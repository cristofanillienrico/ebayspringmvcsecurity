package it.prova.ebayspringmvcsecurity.repository.acquisto;

import it.prova.ebayspringmvcsecurity.model.Acquisto;
import it.prova.ebayspringmvcsecurity.model.Utente;
import org.springframework.data.jpa.repository.EntityGraph;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface AcquistoRepository extends CrudRepository<Acquisto, Long> {

    @EntityGraph(attributePaths = {"utente"})
    List<Acquisto> findByUtente(Utente utente);

}
