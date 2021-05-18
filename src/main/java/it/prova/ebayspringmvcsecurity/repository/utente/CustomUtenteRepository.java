package it.prova.ebayspringmvcsecurity.repository.utente;


import it.prova.ebayspringmvcsecurity.model.StatoUtente;
import it.prova.ebayspringmvcsecurity.model.Utente;

import java.util.List;
import java.util.Optional;

public interface CustomUtenteRepository {
	List<Utente> findByExample(Utente example);

	public Long countByAdmin();

	public Optional<Utente> findOneEager(Long id);

	public List<StatoUtente> listAllStati();

}
