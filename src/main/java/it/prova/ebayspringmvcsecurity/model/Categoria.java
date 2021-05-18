package it.prova.ebayspringmvcsecurity.model;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "categoria")
public class Categoria {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private Long id;

	@NotBlank(message = "{descrizione.notblank}")
	@Column(name = "descrizione")
	private String descrizione;

	@NotBlank(message = "{codice.notblank}")
	@Column(name = "codice")
	private String codice;

	@ManyToMany
	@JoinTable(name = "categoria_annuncio", joinColumns = @JoinColumn(name = "categoria_id", referencedColumnName = "id"), inverseJoinColumns = @JoinColumn(name = "annuncio_id", referencedColumnName = "id"))
	private Set<Annuncio> annunci = new HashSet<>();

	public Categoria() {
		super();
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

	public String getCodice() {
		return codice;
	}

	public void setCodice(String codice) {
		this.codice = codice;
	}

	public Set<Annuncio> getAnnunci() {
		return annunci;
	}

	public void setAnnunci(Set<Annuncio> annunci) {
		this.annunci = annunci;
	}

}
