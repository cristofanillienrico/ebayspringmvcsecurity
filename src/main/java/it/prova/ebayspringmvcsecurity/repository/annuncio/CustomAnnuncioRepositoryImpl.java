package it.prova.ebayspringmvcsecurity.repository.annuncio;

import it.prova.ebayspringmvcsecurity.model.Annuncio;
import org.apache.commons.lang3.StringUtils;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

public class CustomAnnuncioRepositoryImpl implements CustomAnnuncioRepository {

    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public List<Annuncio> findByExample(Annuncio example) {
        Map<String, Object> paramaterMap = new HashMap<String, Object>();
        List<String> whereClauses = new ArrayList<String>();

        StringBuilder queryBuilder = new StringBuilder("select a from Annuncio a left join fetch a.categorie c where a.id = a.id ");

        if (StringUtils.isNotEmpty(example.getTestoAnnuncio())) {
            whereClauses.add(" a.testoAnnuncio  like :testoAnnuncio ");
            paramaterMap.put("testoAnnuncio", "%" + example.getTestoAnnuncio() + "%");
        }

        if (example.getPrezzo() != null) {
            whereClauses.add("a.prezzo >= :prezzo ");
            paramaterMap.put("prezzo", example.getPrezzo());
        }

        if (example.getCategorie() != null && !example.getCategorie().isEmpty()) {
            whereClauses.add(" c.id in :idList ");
            paramaterMap.put("idList", example.getCategorie().stream().map(categoria -> categoria.getId()).collect(Collectors.toList()));
        }


        queryBuilder.append(!whereClauses.isEmpty() ? " and " : "");
        queryBuilder.append(StringUtils.join(whereClauses, " and "));
        TypedQuery<Annuncio> typedQuery = entityManager.createQuery(queryBuilder.toString(), Annuncio.class);

        for (String key : paramaterMap.keySet()) {
            typedQuery.setParameter(key, paramaterMap.get(key));
        }

        return typedQuery.getResultList();
    }
}
