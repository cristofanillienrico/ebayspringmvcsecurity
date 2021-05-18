package it.prova.ebayspringmvcsecurity;

import it.prova.ebayspringmvcsecurity.model.Ruolo;
import it.prova.ebayspringmvcsecurity.model.StatoUtente;
import it.prova.ebayspringmvcsecurity.model.Utente;
import it.prova.ebayspringmvcsecurity.service.ruolo.RuoloService;
import it.prova.ebayspringmvcsecurity.service.utente.UtenteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.security.crypto.password.PasswordEncoder;

import java.util.Date;

@SpringBootApplication
public class EbayspringmvcsecurityApplication implements CommandLineRunner {

	@Autowired
	private RuoloService ruoloServiceInstance;
	@Autowired
	private UtenteService utenteServiceInstance;
	@Autowired
	private PasswordEncoder passwordEncoder;

	public static void main(String[] args) {
		SpringApplication.run(EbayspringmvcsecurityApplication.class, args);
	}

	@Override
	public void run(String... args) throws Exception {
		if (ruoloServiceInstance.cercaPerDescrizioneECodice("Administrator", "ROLE_ADMIN") == null) {
			ruoloServiceInstance.inserisciNuovo(new Ruolo("Administrator", "ROLE_ADMIN"));
		}

		if (ruoloServiceInstance.cercaPerDescrizioneECodice("Classic User", "ROLE_CLASSIC_USER") == null) {
			ruoloServiceInstance.inserisciNuovo(new Ruolo("Classic User", "ROLE_CLASSIC_USER"));
		}

		// A DIFFERENZA DEGLI ALTRI PROGETTI CERCO SOLO PER USERNAME PERCHE' SE VADO
		// ANCHE PER
		// PASSWORD OGNI VOLTA NE INSERISCE UNO NUOVO
		if (utenteServiceInstance.findByUsername("admin") == null) {
			Utente admin = new Utente("admin", passwordEncoder.encode("admin"), "Mario", "Rossi", new Date());
			admin.setStato(StatoUtente.ATTIVO);
			admin.getRuoli().add(ruoloServiceInstance.cercaPerDescrizioneECodice("Administrator", "ROLE_ADMIN"));
			utenteServiceInstance.inserisciNuovo(admin);
		}

		if (utenteServiceInstance.findByUsername("user") == null) {
			Utente classicUser = new Utente("user", passwordEncoder.encode("user"), "Antonio", "Verdi", new Date());
			classicUser.setStato(StatoUtente.ATTIVO);
			classicUser.getRuoli()
					.add(ruoloServiceInstance.cercaPerDescrizioneECodice("Classic User", "ROLE_CLASSIC_USER"));
			utenteServiceInstance.inserisciNuovo(classicUser);
		}

		if (utenteServiceInstance.findByUsername("user1") == null) {
			Utente classicUser1 = new Utente("user1", passwordEncoder.encode("user1"), "Antonioo", "Verdii",
					new Date());
			classicUser1.setStato(StatoUtente.ATTIVO);
			classicUser1.getRuoli()
					.add(ruoloServiceInstance.cercaPerDescrizioneECodice("Classic User", "ROLE_CLASSIC_USER"));
			utenteServiceInstance.inserisciNuovo(classicUser1);
		}

		if (utenteServiceInstance.findByUsername("user2") == null) {
			Utente classicUser2 = new Utente("user2", passwordEncoder.encode("user2"), "Antoniooo", "Verdiii",
					new Date());
			classicUser2.setStato(StatoUtente.ATTIVO);
			classicUser2.getRuoli()
					.add(ruoloServiceInstance.cercaPerDescrizioneECodice("Classic User", "ROLE_CLASSIC_USER"));
			utenteServiceInstance.inserisciNuovo(classicUser2);
		}

	}
}
