package model;

import java.io.Serializable;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

@Entity
@Table(name="BUKiP")
public class Bukip implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name="bukipId")
	private Long bukipId;
	
	@Column(name="NAZWA")
	private String bukipNazwa;
	
	@Column(name="ADRES")
	private String bukipAdres;
	
	@Column(name="POWIERZCHNIA")
	private Double bukipPowierzchnia;
	
	@Column(name="LICZBA_UZYTKOWNIKOW")
	private Integer bukipLiczbaUzytkownikow;
	
	@OneToMany(mappedBy="bup")
	@OnDelete(action=OnDeleteAction.CASCADE)
	private Set<ZuzycieBup> zuzyciaBukip;

	public Long getBukipId() {
		return bukipId;
	}

	public void setBukipId(Long bukipId) {
		this.bukipId = bukipId;
	}

	public String getBukipNazwa() {
		return bukipNazwa;
	}

	public void setBukipNazwa(String bukipNazwa) {
		this.bukipNazwa = bukipNazwa;
	}

	public String getBukipAdres() {
		return bukipAdres;
	}

	public void setBukipAdres(String bukipAdres) {
		this.bukipAdres = bukipAdres;
	}

	public Double getBukipPowierzchnia() {
		return bukipPowierzchnia;
	}

	public void setBukipPowierzchnia(Double bukipPowierzchnia) {
		this.bukipPowierzchnia = bukipPowierzchnia;
	}

	public Integer getBukipLiczbaUzytkownikow() {
		return bukipLiczbaUzytkownikow;
	}

	public void setBukipLiczbaUzytkownikow(Integer bukipLiczbaUzytkownikow) {
		this.bukipLiczbaUzytkownikow = bukipLiczbaUzytkownikow;
	}

	public Set<ZuzycieBup> getZuzyciaBukip() {
		return zuzyciaBukip;
	}

	public void setZuzyciaBukip(Set<ZuzycieBup> zuzyciaBukip) {
		this.zuzyciaBukip = zuzyciaBukip;
	}
	
}
