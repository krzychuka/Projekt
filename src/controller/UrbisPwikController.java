package controller;

import java.util.HashMap;
import java.util.Map;

import model.UrbisPwik;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import service.UrbisPwikService;
import bean.UrbisPwikBean;

@Controller
public class UrbisPwikController {
	
	@Autowired
	private UrbisPwikService urbisPwikService;
	
	@RequestMapping(value = "/urbisPwik.html", method = RequestMethod.GET)
	public String urbisPwik(ModelMap model) {

		return "dodajUrbisPwik";

	}

	@RequestMapping(value = "/listaUrbisPwik.html", method = RequestMethod.GET)
	public String listaUrbisPwik(ModelMap model) {

		return "listaUrbisPwik";

	}
	
	@RequestMapping(value = "/saveUrbisPwik", method = RequestMethod.POST)
	public ModelAndView saveUrbisPwik(@ModelAttribute("command") UrbisPwik urbisPwik, BindingResult result){
		urbisPwik.setUrbisPwikNazwa(urbisPwik.getUrbisPwikNazwa());
		urbisPwik.setUrbisPwikAdres(urbisPwik.getUrbisPwikAdres());
		urbisPwik.setUrbisPwikPowierzchnia(urbisPwik.getUrbisPwikPowierzchnia());
		urbisPwik.setUrbisPwikLiczbaUzytkownikow(urbisPwik.getUrbisPwikLiczbaUzytkownikow());
		urbisPwikService.addUrbisPwik(urbisPwik);
		return new ModelAndView("redirect:/urbisPwik.html");
	}
	
	@RequestMapping(value = "/deleteUrbisPwik", method = RequestMethod.GET)
	public ModelAndView deleteUrbisPwik(
			@ModelAttribute("command") UrbisPwikBean urbisPwikBean, BindingResult result) {
		urbisPwikService.deleteUrbisPwik(prepareModel(urbisPwikBean));
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("dodajUrbisPwik", null);
		return new ModelAndView("listaUrbisPwik", model);
	}
	
	@RequestMapping(value = "/editUrbisPwik", method = RequestMethod.GET)
	public ModelAndView editUrbisPwik(
			@ModelAttribute("command") UrbisPwikBean urbisPwikBean, BindingResult result) {
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("urbisPwik", prepareUrbisPwikBean(urbisPwikService.getUrbisPwik(urbisPwikBean.getUrbisPwikId())));
		return new ModelAndView("dodajUrbisPwik", model);
	}
	
	

	private UrbisPwikBean prepareUrbisPwikBean(UrbisPwik urbisPwik) {
		UrbisPwikBean bean = new UrbisPwikBean();
		bean.setNazwa(urbisPwik.getUrbisPwikNazwa());
		bean.setAdres(urbisPwik.getUrbisPwikAdres());
		bean.setLiczbaUzytkownikow(urbisPwik.getUrbisPwikLiczbaUzytkownikow());
		bean.setPowierzchnia(urbisPwik.getUrbisPwikPowierzchnia());
		bean.setUrbisPwikId(urbisPwik.getUrbisPwikId());
		return bean;
	}

	private UrbisPwik prepareModel(UrbisPwikBean urbisPwikBean) {
		UrbisPwik urbisPwik = new UrbisPwik();
		urbisPwik.setUrbisPwikNazwa(urbisPwikBean.getNazwa());
		urbisPwik.setUrbisPwikAdres(urbisPwikBean.getAdres());
		urbisPwik.setUrbisPwikLiczbaUzytkownikow(urbisPwikBean.getLiczbaUzytkownikow());
		urbisPwik.setUrbisPwikPowierzchnia(urbisPwikBean.getPowierzchnia());
		urbisPwik.setUrbisPwikId(urbisPwikBean.getUrbisPwikId());
		urbisPwikBean.setUrbisPwikId(null);
		return urbisPwik;
	}

}
