package it.prova.ebayspringmvcsecurity.service.categoria;

import it.prova.ebayspringmvcsecurity.model.Categoria;
import it.prova.ebayspringmvcsecurity.repository.categoria.CategoriaRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CategoriaServiceImpl implements CategoriaService{

    @Autowired
    private CategoriaRepository repository;

    @Override
    public List<Categoria> listAllElements() {
        return (List<Categoria>) repository.findAll();
    }

    @Override
    public Categoria caricaSingoloElemento(Long id) {
        return repository.findById(id).orElse(null);
    }

    @Override
    public void aggiorna(Categoria categoriaInstance) {
        repository.save(categoriaInstance);
    }

    @Override
    public void inserisciNuovo(Categoria categoriaInstance) {
        repository.save(categoriaInstance);
    }

    @Override
    public void rimuovi(Categoria categoriaInstance) {
        repository.delete(categoriaInstance);
    }
}
