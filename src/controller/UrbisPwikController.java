package controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import model.UrbisPwik;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import service.UrbisPwikService;
import service.ZuzycieUrbisPwikService;
import bean.UrbisPwikBean;

@Controller
public class UrbisPwikController {
	
	@Autowired
	private UrbisPwikService urbisPwikService;
	
	@Autowired
	private ZuzycieUrbisPwikService zuzycieUrbisPwikService;
	
	@RequestMapping(value = "/urbisPwik", method = RequestMethod.GET)
	public ModelAndView urbisPwikModel(@ModelAttribute("command") UrbisPwikBean urbisPwikBean, BindingResult result) {

		return new ModelAndView("dodajUrbisPwik");

	}
	
	@RequestMapping(value = "/urbisPwiks.html", method = RequestMethod.GET)
	public ModelAndView listaUrbisPwik() {
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("urbisPwiks", prepareListOfUrbisPwikBean(urbisPwikService.urbisPwikList()));
		return new ModelAndView("listaUrbisPwik", model);

	}

	@RequestMapping(value = "/saveUrbisPwik", method = RequestMethod.POST)
	public ModelAndView saveUrbisPwik(@ModelAttribute("command") @Valid UrbisPwikBean urbisPwikBean,
			BindingResult result) {
		if (result.hasErrors()) {
			return new ModelAndView("dodajUrbisPwik");
		} else {
			UrbisPwik urbisPwik = prepareModel(urbisPwikBean);
			urbisPwikService.addUrbisPwik(urbisPwik);
			return new ModelAndView("redirect:/urbisPwiks.html");
		}
	}
	
	@RequestMapping(value = "/editUrbisPwik", method = RequestMethod.GET)
	public ModelAndView editUrbisPwik(
			@ModelAttribute("command") UrbisPwikBean urbisPwikBean, BindingResult result) {
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("urbisPwik", prepareUrbisPwikBean(urbisPwikService.getUrbisPwik(urbisPwikBean.getId())));
		return new ModelAndView("dodajUrbisPwik", model);
	}
	
	@RequestMapping(value = "/otworzUrbisPwik", method = RequestMethod.GET)
	public ModelAndView otworz(@ModelAttribute("command") UrbisPwikBean urbisPwikBean,
			BindingResult result) {
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("urbisPwik", prepareUrbisPwikBean(urbisPwikService.getUrbisPwik(urbisPwikBean.getId())));
		return new ModelAndView("szczegolyUrbisPwik", model);
	}

	private UrbisPwikBean prepareUrbisPwikBean(UrbisPwik urbisPwik) {
		UrbisPwikBean bean = new UrbisPwikBean();
		bean.setNazwa(urbisPwik.getUrbisPwikNazwa());
		bean.setAdres(urbisPwik.getUrbisPwikAdres());
		bean.setLiczbaUzytkownikow(urbisPwik.getUrbisPwikLiczbaUzytkownikow());
		bean.setPowierzchnia(urbisPwik.getUrbisPwikPowierzchnia());
		bean.setId(urbisPwik.getUrbisPwikId());
		return bean;
	}

	private UrbisPwik prepareModel(UrbisPwikBean urbisPwikBean) {
		UrbisPwik urbisPwik = new UrbisPwik();
		urbisPwik.setUrbisPwikNazwa(urbisPwikBean.getNazwa());
		urbisPwik.setUrbisPwikAdres(urbisPwikBean.getAdres());
		urbisPwik.setUrbisPwikLiczbaUzytkownikow(urbisPwikBean.getLiczbaUzytkownikow());
		urbisPwik.setUrbisPwikPowierzchnia(urbisPwikBean.getPowierzchnia());
		urbisPwik.setUrbisPwikId(urbisPwikBean.getId());
		urbisPwikBean.setId(null);
		return urbisPwik;
	}
	
	private List<UrbisPwikBean> prepareListOfUrbisPwikBean(List<UrbisPwik> urbisPwiks) {
		List<UrbisPwikBean> beans = null;
		if (urbisPwiks != null && !urbisPwiks.isEmpty()) {
			beans = new ArrayList<UrbisPwikBean>();
			UrbisPwikBean bean = null;
			for (UrbisPwik urbisPwik : urbisPwiks) {
				bean = new UrbisPwikBean();
				bean.setId(urbisPwik.getUrbisPwikId());
				bean.setNazwa(urbisPwik.getUrbisPwikNazwa());
				bean.setAdres(urbisPwik.getUrbisPwikAdres());
				bean.setPowierzchnia(urbisPwik.getUrbisPwikPowierzchnia());
				bean.setLiczbaUzytkownikow(urbisPwik.getUrbisPwikLiczbaUzytkownikow());
				beans.add(bean);
			}
		}
		return beans;
	}



}
