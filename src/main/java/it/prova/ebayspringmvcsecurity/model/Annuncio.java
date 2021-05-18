package it.prova.ebayspringmvcsecurity.model;

import javax.persistence.*;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "annuncio")
public class Annuncio {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private Long id;

	@Column(columnDefinition = "tinyInt(1) default 1", name = "stato_annuncio")
	private Boolean statoAnnuncio;

	@NotBlank(message = "{testoannuncio.notblank}", groups = AnnuncioValidParam.class)
	@Column(name = "testoAnnuncio")
	private String testoAnnuncio;

	@NotNull(message = "{prezzo.notnull}", groups = AnnuncioValidParam.class)
	@Min(value = 0)
	@Column(name = "prezzo")
	private Double prezzo;

	@NotNull(message = "{datapubblicazione.notnull}")
	@Column(name = "data_pubblicazione")
	private Date dataPubblicazione;

	@NotNull(message = "{utente.notnull}")
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "utente_id")
	private Utente utente;

	@ManyToMany(mappedBy = "annunci")
	private Set<Categoria> categorie = new HashSet<>();

	public Annuncio() {
		super();
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Boolean getStatoAnnuncio() {
		return statoAnnuncio;
	}

	public void setStatoAnnuncio(Boolean statoAnnuncio) {
		this.statoAnnuncio = statoAnnuncio;
	}

	public String getTestoAnnuncio() {
		return testoAnnuncio;
	}

	public void setTestoAnnuncio(String testoAnnuncio) {
		this.testoAnnuncio = testoAnnuncio;
	}

	public Double getPrezzo() {
		return prezzo;
	}

	public void setPrezzo(Double prezzo) {
		this.prezzo = prezzo;
	}

	public Date getDataPubblicazione() {
		return dataPubblicazione;
	}

	public void setDataPubblicazione(Date dataPubblicazione) {
		this.dataPubblicazione = dataPubblicazione;
	}

	public Utente getUtente() {
		return utente;
	}

	public void setUtente(Utente utente) {
		this.utente = utente;
	}

	public Set<Categoria> getCategorie() {
		return categorie;
	}

	public void setCategorie(Set<Categoria> categorie) {
		this.categorie = categorie;
	}

}
