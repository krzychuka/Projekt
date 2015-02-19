package controller;

import model.ZuzycieBukip;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import service.ZuzycieBukipService;

@Controller
public class ZuzycieBukipController {
	
	@Autowired
	private ZuzycieBukipService zuzycieBukipService;
	
	@RequestMapping(value = "/zuzycieBukip.html", method = RequestMethod.GET)
	public String zuzycieBukip(ModelMap model) {

		return "dodajZuzycieBukip";

	}	
	
	@RequestMapping(value = "/saveZuzycieBukip", method = RequestMethod.POST)
	public ModelAndView saveZuzycieBukip(@ModelAttribute("command") ZuzycieBukip zuzycieBukip, 
			BindingResult result){
		zuzycieBukip.setZuzycieFinalne(zuzycieBukip.getZuzycieFinalne());
		zuzycieBukip.setZuzycieBaP(zuzycieBukip.getZuzycieBaP());
		zuzycieBukip.setZuzycieCO(zuzycieBukip.getZuzycieCO());
		zuzycieBukip.setZuzycieCO2(zuzycieBukip.getZuzycieCO2());
		zuzycieBukip.setZuzycieNox(zuzycieBukip.getZuzycieNox());
		zuzycieBukip.setZuzyciePyl(zuzycieBukip.getZuzyciePyl());
		zuzycieBukip.setZuzycieSO2(zuzycieBukip.getZuzycieSO2());
		zuzycieBukip.setZuzycieRok(zuzycieBukip.getZuzycieRok());
		zuzycieBukip.setBukipId(zuzycieBukip.getBukipId());
		zuzycieBukipService.addZuzycieBukip(zuzycieBukip);
		return new ModelAndView("redirect:/zuzycieBup.html");		
	}

}
