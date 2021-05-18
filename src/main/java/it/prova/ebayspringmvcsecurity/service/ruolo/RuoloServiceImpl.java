package it.prova.ebayspringmvcsecurity.service.ruolo;

import it.prova.ebayspringmvcsecurity.model.Ruolo;
import it.prova.ebayspringmvcsecurity.repository.ruolo.RuoloRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service
public class RuoloServiceImpl implements RuoloService {

	@Autowired
	private RuoloRepository ruoloRepository;

	@Transactional(readOnly = true)
	public List<Ruolo> listAll() {
		return (List<Ruolo>) ruoloRepository.findAll();
	}

	@Transactional(readOnly = true)
	public Ruolo caricaSingoloElemento(Long id) {
		return ruoloRepository.findById(id).orElse(null);
	}

	@Transactional
	public void aggiorna(Ruolo ruoloInstance) {
		ruoloRepository.save(ruoloInstance);
	}

	@Transactional
	public void inserisciNuovo(Ruolo ruoloInstance) {
		ruoloRepository.save(ruoloInstance);
	}

	@Transactional
	public void rimuovi(Ruolo ruoloInstance) {
		ruoloRepository.delete(ruoloInstance);

	}

	@Transactional(readOnly = true)
	public Ruolo cercaPerDescrizioneECodice(String descrizione, String codice) {
		return ruoloRepository.findByDescrizioneAndCodice(descrizione, codice);
	}

	@Transactional(readOnly = true)
	public List<Ruolo> findByArrayIdParam(String[] ids) {
		List<Ruolo> ruoli = new ArrayList<>();
		if (ids != null && ids.length > 0) {
			for (String ruoloItem : ids) {
				ruoli.add(ruoloRepository.findById(Long.parseLong(ruoloItem)).orElse(null));
			}
		}
		return ruoli;
	}

}
