package model;

import java.io.Serializable;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

@Entity
@Table(name="BUP")
public class Bup implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue
	@Column(name="bupId")
	private Long bupId;
	
	@Column(name="NAZWA")
	private String bupNazwa;
	
	@Column(name="ADRES")
	private String bupAdres;
	
	@Column(name="POWIERZCHNIA")
	private Double bupPowierzchnia;
	
	@Column(name="LICZBA_UZYTKOWNIKOW")
	private Integer bupLiczbaUzytkownikow;
	
	@OneToMany(mappedBy="bup")
	@OnDelete(action=OnDeleteAction.CASCADE)
	private Set<ZuzycieBup> zuzycia;

	public Long getBupId() {
		return bupId;
	}

	public void setBupId(Long bupId) {
		this.bupId = bupId;
	}

	public String getBupNazwa() {
		return bupNazwa;
	}

	public void setBupNazwa(String bupNazwa) {
		this.bupNazwa = bupNazwa;
	}

	public String getBupAdres() {
		return bupAdres;
	}

	public void setBupAdres(String bupAdres) {
		this.bupAdres = bupAdres;
	}

	public Double getBupPowierzchnia() {
		return bupPowierzchnia;
	}

	public void setBupPowierzchnia(Double bupPowierzchnia) {
		this.bupPowierzchnia = bupPowierzchnia;
	}

	public Integer getBupLiczbaUzytkownikow() {
		return bupLiczbaUzytkownikow;
	}

	public void setBupLiczbaUzytkownikow(Integer bupLiczbaUzytkownikow) {
		this.bupLiczbaUzytkownikow = bupLiczbaUzytkownikow;
	}

	public Set<ZuzycieBup> getZuzycia() {
		return zuzycia;
	}

	public void setZuzycia(Set<ZuzycieBup> zuzycia) {
		this.zuzycia = zuzycia;
	}

}
