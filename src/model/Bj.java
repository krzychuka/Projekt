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
@Table(name = "BJ")
public class Bj implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue
	@Column(name = "bjId")
	private Long bjId;

	@Column(name = "SPOSOB_OGRZEWANIA")
	private String sposobOgrzewania;

	@Column(name = "SPOSOB_PRZYGOTOWANIA_CWU")
	private String sposobPrzygotowaniaCWU;

	@OneToMany(mappedBy = "bj")
	@OnDelete(action = OnDeleteAction.CASCADE)
	private Set<ZuzycieBj> zuzyciaBJ;

	public Long getBjId() {
		return bjId;
	}

	public void setBjId(Long bjId) {
		this.bjId = bjId;
	}

	public String getSposobOgrzewania() {
		return sposobOgrzewania;
	}

	public void setSposobOgrzewania(String sposobOgrzewania) {
		this.sposobOgrzewania = sposobOgrzewania;
	}

	public String getSposobPrzygotowaniaCWU() {
		return sposobPrzygotowaniaCWU;
	}

	public void setSposobPrzygotowaniaCWU(String sposobPrzygotowaniaCWU) {
		this.sposobPrzygotowaniaCWU = sposobPrzygotowaniaCWU;
	}

	public Set<ZuzycieBj> getZuzyciaBJ() {
		return zuzyciaBJ;
	}

	public void setZuzyciaBJ(Set<ZuzycieBj> zuzyciaBJ) {
		this.zuzyciaBJ = zuzyciaBJ;
	}

}
