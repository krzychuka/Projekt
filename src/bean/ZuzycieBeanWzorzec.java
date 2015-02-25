package bean;

import javax.validation.constraints.NotNull;

import org.springframework.format.annotation.NumberFormat;
import org.springframework.format.annotation.NumberFormat.Style;

public class ZuzycieBeanWzorzec {
	
	@NotNull(message="Proszê wype³niæ pole")
	@NumberFormat(style=Style.NUMBER)
	private Double finalne;
	
	@NotNull(message="Proszê wype³niæ pole")
	@NumberFormat(style=Style.NUMBER)
	private Double sO2;
	
	@NotNull(message="Proszê wype³niæ pole")
	@NumberFormat(style=Style.NUMBER)
	private Double nox;
	
	@NotNull(message="Proszê wype³niæ pole")
	@NumberFormat(style=Style.NUMBER)
	private Double cO;
	
	@NotNull(message="Proszê wype³niæ pole")
	@NumberFormat(style=Style.NUMBER)
	private Double pyl;
	
	@NotNull(message="Proszê wype³niæ pole")
	@NumberFormat(style=Style.NUMBER)
	private Double cO2;
	
	@NotNull(message="Proszê wype³niæ pole")
	@NumberFormat(style=Style.NUMBER)
	private Double baP;
	
	private Double rok;

	public Double getFinalne() {
		return finalne;
	}

	public void setFinalne(Double finalne) {
		this.finalne = finalne;
	}

	public Double getsO2() {
		return sO2;
	}

	public void setsO2(Double sO2) {
		this.sO2 = sO2;
	}

	public Double getNox() {
		return nox;
	}

	public void setNox(Double nox) {
		this.nox = nox;
	}

	public Double getcO() {
		return cO;
	}

	public void setcO(Double cO) {
		this.cO = cO;
	}

	public Double getPyl() {
		return pyl;
	}

	public void setPyl(Double pyl) {
		this.pyl = pyl;
	}

	public Double getcO2() {
		return cO2;
	}

	public void setcO2(Double cO2) {
		this.cO2 = cO2;
	}

	public Double getBaP() {
		return baP;
	}

	public void setBaP(Double baP) {
		this.baP = baP;
	}

	public Double getRok() {
		return rok;
	}

	public void setRok(Double rok) {
		this.rok = rok;
	}

}
