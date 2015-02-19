package controller;

import java.util.HashMap;
import java.util.Map;

import model.Bukip;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import service.BukipService;
import service.ZuzycieBukipService;
import bean.BukipBean;

@Controller
public class BukipController {

	@Autowired
	private BukipService bukipService;
	
	@Autowired
	private ZuzycieBukipService zuzycieBukipService;
	
	@RequestMapping(value = "/bukip.html", method = RequestMethod.GET)
	public String printMessage1(ModelMap model) {

		return "dodajBukip";

	}
	
	@RequestMapping(value = "/listaBukip.html", method = RequestMethod.GET)
	public String listaBukip(ModelMap model) {

		return "listaBukip";

	}
	
	@RequestMapping(value = "/saveBukip", method = RequestMethod.POST)
	public ModelAndView saveBukip(@ModelAttribute("command") Bukip bukip, BindingResult result){
		bukip.setBukipNazwa(bukip.getBukipNazwa());
		bukip.setBukipAdres(bukip.getBukipAdres());
		bukip.setBukipPowierzchnia(bukip.getBukipPowierzchnia());
		bukip.setBukipLiczbaUzytkownikow(bukip.getBukipLiczbaUzytkownikow());
		bukipService.addBukip(bukip);
		return new ModelAndView("redirect:/bukip.html");
	}
	
	@RequestMapping(value = "/deleteBukip", method = RequestMethod.GET)
	public ModelAndView deleteBukip(
			@ModelAttribute("command") BukipBean bukipBean, BindingResult result) {
		bukipService.deleteBukip(prepareModel(bukipBean));
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("dodajBukip", null);
		return new ModelAndView("listaBukip", model);
	}
	
	@RequestMapping(value = "/editBukip", method = RequestMethod.GET)
	public ModelAndView editBukip(
			@ModelAttribute("command") BukipBean bukipBean, BindingResult result) {
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("bukip", prepareBukipBean(bukipService.getBukip(bukipBean.getBukipId())));
		return new ModelAndView("dodajBukip", model);
	}
	
	

	private BukipBean prepareBukipBean(Bukip bukip) {
		BukipBean bean = new BukipBean();
		bean.setNazwa(bukip.getBukipNazwa());
		bean.setAdres(bukip.getBukipAdres());
		bean.setLiczbaUzytkownikow(bukip.getBukipLiczbaUzytkownikow());
		bean.setPowierzchnia(bukip.getBukipPowierzchnia());
		bean.setBukipId(bukip.getBukipId());
		return bean;
	}

	private Bukip prepareModel(BukipBean bukipBean) {
		Bukip bukip = new Bukip();
		bukip.setBukipNazwa(bukipBean.getNazwa());
		bukip.setBukipAdres(bukipBean.getAdres());
		bukip.setBukipLiczbaUzytkownikow(bukipBean.getLiczbaUzytkownikow());
		bukip.setBukipPowierzchnia(bukipBean.getPowierzchnia());
		bukip.setBukipId(bukipBean.getBukipId());
		bukipBean.setBukipId(null);
		return bukip;
	}
}
