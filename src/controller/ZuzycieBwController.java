package controller;

import model.ZuzycieBw;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import service.ZuzycieBwService;

@Controller
public class ZuzycieBwController {

	@Autowired
	private ZuzycieBwService zuzycieBwService;

	@RequestMapping(value = "/zuzycieBw.html", method = RequestMethod.GET)
	public String zuzycieBw(ModelMap model) {

		return "dodajZuzycieBw";

	}	
	
	@RequestMapping(value = "/saveZuzycieBw", method = RequestMethod.POST)
	public ModelAndView saveZuzycieBw(@ModelAttribute("command") ZuzycieBw zuzycieBw, 
			BindingResult result){
		zuzycieBw.setZuzycieFinalne(zuzycieBw.getZuzycieFinalne());
		zuzycieBw.setZuzycieBaP(zuzycieBw.getZuzycieBaP());
		zuzycieBw.setZuzycieCO(zuzycieBw.getZuzycieCO());
		zuzycieBw.setZuzycieCO2(zuzycieBw.getZuzycieCO2());
		zuzycieBw.setZuzycieNox(zuzycieBw.getZuzycieNox());
		zuzycieBw.setZuzyciePyl(zuzycieBw.getZuzyciePyl());
		zuzycieBw.setZuzycieSO2(zuzycieBw.getZuzycieSO2());
		zuzycieBw.setZuzycieRok(zuzycieBw.getZuzycieRok());
		zuzycieBw.setBwId(zuzycieBw.getBwId());
		zuzycieBwService.addZuzycieBw(zuzycieBw);
		return new ModelAndView("redirect:/zuzycieBw.html");		
	}
}
