package bean;

public abstract class BudynekWzorzec {
		
	private String nazwa;	
	private String adres;	
	private Integer liczbaUzytkownikow;	
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
