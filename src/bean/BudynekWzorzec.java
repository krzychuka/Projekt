package bean;

import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.format.annotation.NumberFormat;
import org.springframework.format.annotation.NumberFormat.Style;

public abstract class BudynekWzorzec {
		
	@NotEmpty(message="Proszê wype³niæ pole")
	private String nazwa;	
	
	@NotEmpty(message="Proszê wype³niæ pole")
	private String adres;	
	
	@NotNull(message="Proszê wype³niæ pole")
	@NumberFormat(style=Style.NUMBER)
	private Integer liczbaUzytkownikow;	
	
	@NotNull(message="Proszê wype³niæ pole")
	@NumberFormat(style=Style.NUMBER)
	private Double powierzchnia;
	
	public String getNazwa() {
		return nazwa;
	}
	public void setNazwa(String nazwa) {
		this.nazwa = nazwa;
	}
	public String getAdres() {
		return adres;
	}
	public void setAdres(String adres) {
		this.adres = adres;
	}
	public Integer getLiczbaUzytkownikow() {
		return liczbaUzytkownikow;
	}
	public void setLiczbaUzytkownikow(Integer liczbaUzytkownikow) {
		this.liczbaUzytkownikow = liczbaUzytkownikow;
	}
	public Double getPowierzchnia() {
		return powierzchnia;
	}
	public void setPowierzchnia(Double powierzchnia) {
		this.powierzchnia = powierzchnia;
	}

}
