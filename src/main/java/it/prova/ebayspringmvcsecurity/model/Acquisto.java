package it.prova.ebayspringmvcsecurity.model;

import javax.persistence.*;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.util.Date;

@Entity
@Table(name = "acquisto")
public class Acquisto {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;

    @NotBlank(message = "{descrizione.notblank}")
    @Column(name = "descrizione")
    private String descrizione;

    @NotNull(message = "{prezzo.notnull}")
    @Min(value = 0)
    @Column(name = "prezzo")
    private Double prezzo;

    @NotNull(message = "{dataacquisto.notnull}")
    @Column(name = "date_acquisto")
    private Date dateAcquisto;

    @NotNull(message = "{utente.notnull}")
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "utente_id")
    private Utente utente;


    public Acquisto() {
        super();
    }

    public Acquisto(String descrizione, Double prezzo, Date dateAcquisto, Utente utente) {
        this.descrizione = descrizione;
        this.prezzo = prezzo;
        this.dateAcquisto = dateAcquisto;
        this.utente = utente;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getDescrizione() {
        return descrizione;
    }

    public void setDescrizione(String descrizione) {
        this.descrizione = descrizione;
    }

    public Double getPrezzo() {
        return prezzo;
    }

    public void setPrezzo(Double prezzo) {
        this.prezzo = prezzo;
    }

    public Date getDateAcquisto() {
        return dateAcquisto;
    }

    public void setDateAcquisto(Date dateAcquisto) {
        this.dateAcquisto = dateAcquisto;
    }

    public Utente getUtente() {
        return utente;
    }

    public void setUtente(Utente utente) {
        this.utente = utente;
    }


    @Override
    public String toString() {
        return "Acquisto [id=" + id + ", descrizione=" + descrizione + ", prezzo=" + prezzo + ", dateAcquisto="
                + dateAcquisto + ", utente=" + utente + "]";
    }

}
