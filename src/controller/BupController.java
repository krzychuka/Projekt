package controller;

import java.util.HashMap;
import java.util.Map;

import model.Bup;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import bean.BupBean;
import service.BupService;
import service.ZuzycieBupService;

@Controller
public class BupController {
	
	@Autowired
	private BupService bupService;
	
	@Autowired
	private ZuzycieBupService zuzycieBupService;
	
	@RequestMapping(value = "/bup.html", method = RequestMethod.GET)
	public String printMessage1(ModelMap model) {

		return "dodajBup";

	}	
	
	@RequestMapping(value = "/bups", method = RequestMethod.GET)
	public String listowBup(ModelMap model) {

		return "listaBup";
	}
		
	@RequestMapping(value = "/saveBup", method = RequestMethod.POST)
	public ModelAndView saveBup(@ModelAttribute("command") Bup bup, BindingResult result){
		bup.setBupNazwa(bup.getBupNazwa());
		bup.setBupAdres(bup.getBupAdres());
		bup.setBupPowierzchnia(bup.getBupPowierzchnia());
		bup.setBupLiczbaUzytkownikow(bup.getBupLiczbaUzytkownikow());
		bupService.addBup(bup);
		return new ModelAndView("redirect:/bup.html");
	}

	@RequestMapping(value = "/deleteBup", method = RequestMethod.GET)
	public ModelAndView deleteBup(
			@ModelAttribute("command") BupBean bupBean, BindingResult result) {
		bupService.deleteBup(prepareModel(bupBean));
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("dodajBup", null);
		return new ModelAndView("listaBup", model);
	}
	
	@RequestMapping(value = "/editBup", method = RequestMethod.GET)
	public ModelAndView editBup(
			@ModelAttribute("command") BupBean bupBean, BindingResult result) {
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("bup", prepareBupBean(bupService.getBup(bupBean.getBupId())));
		return new ModelAndView("dodajBup", model);
	}
	
	

	private BupBean prepareBupBean(Bup bup) {
		BupBean bean = new BupBean();
		bean.setNazwa(bup.getBupNazwa());
		bean.setAdres(bup.getBupAdres());
		bean.setLiczbaUzytkownikow(bup.getBupLiczbaUzytkownikow());
		bean.setPowierzchnia(bup.getBupPowierzchnia());
		bean.setBupId(bup.getBupId());
		return bean;
	}

	private Bup prepareModel(BupBean bupBean) {
		Bup bup = new Bup();
		bup.setBupNazwa(bupBean.getNazwa());
		bup.setBupAdres(bupBean.getAdres());
		bup.setBupLiczbaUzytkownikow(bupBean.getLiczbaUzytkownikow());
		bup.setBupPowierzchnia(bupBean.getPowierzchnia());
		bup.setBupId(bupBean.getBupId());
		bupBean.setBupId(null);
		return bup;
	}
	
}
