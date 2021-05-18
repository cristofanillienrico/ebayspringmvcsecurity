package it.prova.ebayspringmvcsecurity.repository.ruolo;

import it.prova.ebayspringmvcsecurity.model.Ruolo;
import org.springframework.data.repository.CrudRepository;

public interface RuoloRepository extends CrudRepository<Ruolo, Long> {
	Ruolo findByDescrizioneAndCodice(String descrizione, String codice);
}
