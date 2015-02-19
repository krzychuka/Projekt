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
@Table(name = "BW")
public class Bw implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue
	@Column(name = "bwId")
	private Long bwId;

	@Column(name = "ADRES")
	private String adres;

	@Column(name = "POWIERZCHNIA")
	private Double powierzchnia;

	@Column(name = "KUBATURA")
	private Double kubatura;

	@OneToMany(mappedBy = "bw")
	@OnDelete(action = OnDeleteAction.CASCADE)
	private Set<ZuzycieBw> zuzyciaBW;

	public Long getBwId() {
		return bwId;
	}

	public void setBwId(Long bwId) {
		this.bwId = bwId;
	}

	public String getAdres() {
		return adres;
	}

	public void setAdres(String adres) {
		this.adres = adres;
	}

	public Double getPowierzchnia() {
		return powierzchnia;
	}

	public void setPowierzchnia(Double powierzchnia) {
		this.powierzchnia = powierzchnia;
	}

	public Double getKubatura() {
		return kubatura;
	}

	public void setKubatura(Double kubatura) {
		this.kubatura = kubatura;
	}

	public Set<ZuzycieBw> getZuzyciaBW() {
		return zuzyciaBW;
	}

	public void setZuzyciaBW(Set<ZuzycieBw> zuzyciaBW) {
		this.zuzyciaBW = zuzyciaBW;
	}

}
