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
@Table(name="UrbisPwik")
public class UrbisPwik implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name="urbisPwikId")
	private Long urbisPwikId;
	
	@Column(name="NAZWA")
	private String urbisPwikNazwa;
	
	@Column(name="ADRES")
	private String urbisPwikAdres;
	
	@Column(name="POWIERZCHNIA")
	private Double urbisPwikPowierzchnia;
	
	@Column(name="LICZBA_UZYTKOWNIKOW")
	private Integer urbisPwikLiczbaUzytkownikow;

	@OneToMany(mappedBy="urbisPwik")
	@OnDelete(action=OnDeleteAction.CASCADE)
	private Set<ZuzycieUrbisPwik> zuzyciaUrbisPwik;
	
	public Long getUrbisPwikId() {
		return urbisPwikId;
	}

	public void setUrbisPwikId(Long urbisPwikId) {
		this.urbisPwikId = urbisPwikId;
	}

	public String getUrbisPwikNazwa() {
		return urbisPwikNazwa;
	}

	public void setUrbisPwikNazwa(String urbisPwikNazwa) {
		this.urbisPwikNazwa = urbisPwikNazwa;
	}

	public String getUrbisPwikAdres() {
		return urbisPwikAdres;
	}

	public void setUrbisPwikAdres(String urbisPwikAdres) {
		this.urbisPwikAdres = urbisPwikAdres;
	}

	public Double getUrbisPwikPowierzchnia() {
		return urbisPwikPowierzchnia;
	}

	public void setUrbisPwikPowierzchnia(Double urbisPwikPowierzchnia) {
		this.urbisPwikPowierzchnia = urbisPwikPowierzchnia;
	}

	public Integer getUrbisPwikLiczbaUzytkownikow() {
		return urbisPwikLiczbaUzytkownikow;
	}

	public void setUrbisPwikLiczbaUzytkownikow(Integer urbisPwikLiczbaUzytkownikow) {
		this.urbisPwikLiczbaUzytkownikow = urbisPwikLiczbaUzytkownikow;
	}

	public Set<ZuzycieUrbisPwik> getZuzyciaUrbisPwik() {
		return zuzyciaUrbisPwik;
	}

	public void setZuzyciaUrbisPwik(Set<ZuzycieUrbisPwik> zuzyciaUrbisPwik) {
		this.zuzyciaUrbisPwik = zuzyciaUrbisPwik;
	}

}
