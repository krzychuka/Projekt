package model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "ZUZYCIE_URBIS_PWIK")
public class ZuzycieUrbisPwik implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue
	@Column(name = "zuzycieUrbisPwikId")
	private Long zuzycieUrbisPwikId;

	@Column(name = "zuzycieFinalne")
	private Double zuzycieFinalne;

	@Column(name = "SO2")
	private Double zuzycieSO2;

	@Column(name = "Nox")
	private Double zuzycieNox;

	@Column(name = "CO")
	private Double zuzycieCO;

	@Column(name = "Pyl")
	private Double zuzyciePyl;

	@Column(name = "CO2")
	private Double zuzycieCO2;

	@Column(name = "BaP")
	private Double zuzycieBaP;

	@Column(name = "Rok")
	private Double zuzycieRok;

	@ManyToOne
	@JoinColumn(name = "urbisPwikId", insertable = false, updatable = false)
	private UrbisPwik urbisPwik;

	private Long urbisPwikId;

	public Long getZuzycieUrbisPwikId() {
		return zuzycieUrbisPwikId;
	}

	public void setZuzycieUrbisPwikId(Long zuzycieUrbisPwikId) {
		this.zuzycieUrbisPwikId = zuzycieUrbisPwikId;
	}

	public Double getZuzycieFinalne() {
		return zuzycieFinalne;
	}

	public void setZuzycieFinalne(Double zuzycieFinalne) {
		this.zuzycieFinalne = zuzycieFinalne;
	}

	public Double getZuzycieSO2() {
		return zuzycieSO2;
	}

	public void setZuzycieSO2(Double zuzycieSO2) {
		this.zuzycieSO2 = zuzycieSO2;
	}

	public Double getZuzycieNox() {
		return zuzycieNox;
	}

	public void setZuzycieNox(Double zuzycieNox) {
		this.zuzycieNox = zuzycieNox;
	}

	public Double getZuzycieCO() {
		return zuzycieCO;
	}

	public void setZuzycieCO(Double zuzycieCO) {
		this.zuzycieCO = zuzycieCO;
	}

	public Double getZuzyciePyl() {
		return zuzyciePyl;
	}

	public void setZuzyciePyl(Double zuzyciePyl) {
		this.zuzyciePyl = zuzyciePyl;
	}

	public Double getZuzycieCO2() {
		return zuzycieCO2;
	}

	public void setZuzycieCO2(Double zuzycieCO2) {
		this.zuzycieCO2 = zuzycieCO2;
	}

	public Double getZuzycieBaP() {
		return zuzycieBaP;
	}

	public void setZuzycieBaP(Double zuzycieBaP) {
		this.zuzycieBaP = zuzycieBaP;
	}

	public Double getZuzycieRok() {
		return zuzycieRok;
	}

	public void setZuzycieRok(Double zuzycieRok) {
		this.zuzycieRok = zuzycieRok;
	}

	public UrbisPwik getUrbisPwik() {
		return urbisPwik;
	}

	public void setUrbisPwik(UrbisPwik urbisPwik) {
		this.urbisPwik = urbisPwik;
	}

	public Long getUrbisPwikId() {
		return urbisPwikId;
	}

	public void setUrbisPwikId(Long urbisPwikId) {
		this.urbisPwikId = urbisPwikId;
	}

}
