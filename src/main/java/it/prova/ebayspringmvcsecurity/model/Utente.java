package it.prova.ebayspringmvcsecurity.model;

import javax.persistence.*;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "utente")
public class Utente {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private Long id;

	@NotBlank(message = "{username.notblank}", groups = {RegistrationParam.class, EditUtenteParam.class, InsertUtenteParam.class})
	@Column(name = "username", unique = true)
	private String username;

	@NotBlank(message = "{password.notblank}", groups = {InsertUtenteParam.class})
	@Column(name = "password")
	private String password;

	@NotBlank(message = "{nome.notblank}", groups = {RegistrationParam.class, EditUtenteParam.class, InsertUtenteParam.class})
	@Column(name = "nome")
	private String nome;

	@NotBlank(message = "{cognome.notblank}", groups = {RegistrationParam.class, EditUtenteParam.class, InsertUtenteParam.class})
	@Column(name = "cognome")
	private String cognome;

	@Min(value = 0, groups = EditUtenteParam.class)
	@Column(name = "credito_residuo")
	private Double creditoResiduo;

	@NotNull(message = "{datacreazione.notnull}")
	@Column(name = "dateCreated")
	private Date dateCreated;

	@Enumerated(EnumType.STRING)
	private StatoUtente stato;

	@ManyToMany
	@JoinTable(name = "utente_ruolo", joinColumns = @JoinColumn(name = "utente_id", referencedColumnName = "ID"), inverseJoinColumns = @JoinColumn(name = "ruolo_id", referencedColumnName = "ID"))
	private Set<Ruolo> ruoli = new HashSet<>();

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "utente")
	private Set<Acquisto> acquisti = new HashSet<>();

	public Utente() {
	}

	public Utente(String username, String password) {
		super();
		this.username = username;
		this.password = password;
	}

	public Utente(String username, String password, String nome, String cognome, Date dateCreated) {
		this.username = username;
		this.password = password;
		this.nome = nome;
		this.cognome = cognome;
		this.dateCreated = dateCreated;
	}

	public Double getCreditoResiduo() {
		return creditoResiduo;
	}

	public void setCreditoResiduo(Double creditoResiduo) {
		this.creditoResiduo = creditoResiduo;
	}

	public Set<Acquisto> getAcquisti() {
		return acquisti;
	}

	public void setAcquisti(Set<Acquisto> acquisti) {
		this.acquisti = acquisti;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Set<Ruolo> getRuoli() {
		return ruoli;
	}

	public void setRuoli(Set<Ruolo> ruoli) {
		this.ruoli = ruoli;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getCognome() {
		return cognome;
	}

	public void setCognome(String cognome) {
		this.cognome = cognome;
	}

	public Date getDateCreated() {
		return dateCreated;
	}

	public void setDateCreated(Date dateCreated) {
		this.dateCreated = dateCreated;
	}

	public StatoUtente getStato() {
		return stato;
	}

	public void setStato(StatoUtente stato) {
		this.stato = stato;
	}

	public boolean isAdmin() {
		for (Ruolo ruoloItem : ruoli) {
			if (ruoloItem.getCodice().equals(Ruolo.ROLE_ADMIN))
				return true;
		}
		return false;
	}

	public boolean isAttivo() {
		return this.stato != null && this.stato.equals(StatoUtente.ATTIVO);
	}

}
