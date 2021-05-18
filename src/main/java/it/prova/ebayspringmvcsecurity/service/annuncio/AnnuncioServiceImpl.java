package it.prova.ebayspringmvcsecurity.service.annuncio;

import it.prova.ebayspringmvcsecurity.model.Annuncio;
import it.prova.ebayspringmvcsecurity.model.Categoria;
import it.prova.ebayspringmvcsecurity.model.Utente;
import it.prova.ebayspringmvcsecurity.repository.annuncio.AnnuncioRepository;
import it.prova.ebayspringmvcsecurity.repository.categoria.CategoriaRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;

@Service
public class AnnuncioServiceImpl implements AnnuncioService {

    @Autowired
    private AnnuncioRepository repository;

    @Autowired
    private CategoriaRepository categoriaRepository;

    @Override
    public List<Annuncio> listAllElements() {
        return (List<Annuncio>) repository.findAll();
    }

    @Override
    public Annuncio caricaSingoloElemento(Long id) {
        return repository.findById(id).orElse(null);
    }

    @Transactional
    @Override
    public void aggiorna(Annuncio annuncioInstance) {
        categoriaRepository.deleteCategoriaByAnnuncio(annuncioInstance.getId());

        repository.save(annuncioInstance);

        if (annuncioInstance.getCategorie() != null) {
            for (Categoria categoriaItem : annuncioInstance.getCategorie()) {
                categoriaItem = categoriaRepository.findById(categoriaItem.getId()).get();
                categoriaItem.getAnnunci().add(annuncioInstance);
                categoriaRepository.save(categoriaItem);
            }
        }

    }

    @Override
    public void inserisciNuovo(Annuncio annuncioInstance) {
        repository.save(annuncioInstance);

        if (annuncioInstance.getCategorie() != null) {

            for (Categoria categoriaItem : annuncioInstance.getCategorie()) {

                categoriaItem = categoriaRepository.findById(categoriaItem.getId()).get();
                categoriaItem.getAnnunci().add(annuncioInstance);
                categoriaRepository.save(categoriaItem);
            }
        }
    }

    @Override
    public void rimuovi(Annuncio annuncioInstance) {
        repository.delete(annuncioInstance);
    }

    @Override
    public List<Annuncio> findByExample(Annuncio annuncioExample) {
        return repository.findByExample(annuncioExample);
    }

    @Override
    public Annuncio caricaSingoloAnnuncioEager(Long idAnnuncio) {
        return repository.findSingleAnnuncioEager(idAnnuncio);
    }

    @Override
    public List<Annuncio> findAllByUtente(Utente utente) {
        return repository.findAllByUtente(utente);
    }
}
