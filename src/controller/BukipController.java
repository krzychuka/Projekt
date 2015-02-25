package controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import model.Bukip;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
	
	@RequestMapping(value = "/bukip", method = RequestMethod.GET)
	public ModelAndView bukipModel(@ModelAttribute("command") BukipBean bukipBean, BindingResult result) {

		return new ModelAndView("dodajBukip");

	}
	
	@RequestMapping(value = "/bukips.html", method = RequestMethod.GET)
	public ModelAndView listaBukip() {
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("bukips", prepareListOfBukipBean(bukipService.bukipList()));
		return new ModelAndView("listaBukip", model);

	}

	@RequestMapping(value = "/saveBukip", method = RequestMethod.POST)
	public ModelAndView saveBukip(@ModelAttribute("command") @Valid BukipBean bukipBean,
			BindingResult result) {
		if (result.hasErrors()) {
			return new ModelAndView("dodajBukip");
		} else {
			Bukip bukip = prepareModel(bukipBean);
			bukipService.addBukip(bukip);
			return new ModelAndView("redirect:/bukips.html");
		}
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
		model.put("bukip", prepareBukipBean(bukipService.getBukip(bukipBean.getId())));
		return new ModelAndView("dodajBukip", model);
	}
	
	@RequestMapping(value = "/otworzBukip", method = RequestMethod.GET)
	public ModelAndView otworz(@ModelAttribute("command") BukipBean bukipBean,
			BindingResult result) {
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("bukip", prepareBukipBean(bukipService.getBukip(bukipBean.getId())));
		return new ModelAndView("szczegolyBukip", model);
	}

	private BukipBean prepareBukipBean(Bukip bukip) {
		BukipBean bean = new BukipBean();
		bean.setNazwa(bukip.getBukipNazwa());
		bean.setAdres(bukip.getBukipAdres());
		bean.setLiczbaUzytkownikow(bukip.getBukipLiczbaUzytkownikow());
		bean.setPowierzchnia(bukip.getBukipPowierzchnia());
		bean.setId(bukip.getBukipId());
		return bean;
	}

	private Bukip prepareModel(BukipBean bukipBean) {
		Bukip bukip = new Bukip();
		bukip.setBukipNazwa(bukipBean.getNazwa());
		bukip.setBukipAdres(bukipBean.getAdres());
		bukip.setBukipLiczbaUzytkownikow(bukipBean.getLiczbaUzytkownikow());
		bukip.setBukipPowierzchnia(bukipBean.getPowierzchnia());
		bukip.setBukipId(bukipBean.getId());
		bukipBean.setId(null);
		return bukip;
	}
	
	private List<BukipBean> prepareListOfBukipBean(List<Bukip> bukips) {
		List<BukipBean> beans = null;
		if (bukips != null && !bukips.isEmpty()) {
			beans = new ArrayList<BukipBean>();
			BukipBean bean = null;
			for (Bukip bukip : bukips) {
				bean = new BukipBean();
				bean.setId(bukip.getBukipId());
				bean.setNazwa(bukip.getBukipNazwa());
				bean.setAdres(bukip.getBukipAdres());
				bean.setPowierzchnia(bukip.getBukipPowierzchnia());
				bean.setLiczbaUzytkownikow(bukip.getBukipLiczbaUzytkownikow());
				beans.add(bean);
			}
		}
		return beans;
	}
}
