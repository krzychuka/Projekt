package controller;

import model.ZuzycieBup;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import service.ZuzycieBupService;

@Controller
public class ZuzycieBupController {
	
	@Autowired
	private ZuzycieBupService zuzycieBupService;
	
	@RequestMapping(value = "/zuzycieBup.html", method = RequestMethod.GET)
	public String zuzycieBup(ModelMap model) {

		return "dodajZuzycieBup";

	}	
	
	@RequestMapping(value = "/saveZuzycieBup", method = RequestMethod.POST)
	public ModelAndView saveZuzycieBup(@ModelAttribute("command") ZuzycieBup zuzycieBup, 
			BindingResult result){
		zuzycieBup.setZuzycieFinalne(zuzycieBup.getZuzycieFinalne());
		zuzycieBup.setZuzycieBaP(zuzycieBup.getZuzycieBaP());
		zuzycieBup.setZuzycieCO(zuzycieBup.getZuzycieCO());
		zuzycieBup.setZuzycieCO2(zuzycieBup.getZuzycieCO2());
		zuzycieBup.setZuzycieNox(zuzycieBup.getZuzycieNox());
		zuzycieBup.setZuzyciePyl(zuzycieBup.getZuzyciePyl());
		zuzycieBup.setZuzycieSO2(zuzycieBup.getZuzycieSO2());
		zuzycieBup.setZuzycieRok(zuzycieBup.getZuzycieRok());
		zuzycieBup.setBupId(zuzycieBup.getBupId());
		zuzycieBupService.addZuzycieBup(zuzycieBup);
		return new ModelAndView("redirect:/zuzycieBup.html");		
	}
	
	
}
