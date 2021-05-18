package it.prova.ebayspringmvcsecurity.repository.utente;

import it.prova.ebayspringmvcsecurity.model.Acquisto;
import it.prova.ebayspringmvcsecurity.model.StatoUtente;
import it.prova.ebayspringmvcsecurity.model.Utente;
import org.springframework.data.jpa.repository.EntityGraph;
import org.springframework.data.repository.CrudRepository;

import java.util.List;
import java.util.Optional;

public interface UtenteRepository extends CrudRepository<Utente, Long>, CustomUtenteRepository {

    Optional<Utente> findByUsername(String username);

    Utente findByUsernameAndPassword(String username, String password);

    // caricamento eager, ovviamente si può fare anche con jpql
    @EntityGraph(attributePaths = {"ruoli"})
    Utente findByUsernameAndPasswordAndStato(String username, String password, StatoUtente stato);


}
