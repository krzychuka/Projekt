package controller;

import model.ZuzycieBj;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import service.ZuzycieBjService;

@Controller
public class ZuzycieBjController {
	
	@Autowired
	private ZuzycieBjService zuzycieBjService;
	
	@RequestMapping(value = "/zuzycieBj.html", method = RequestMethod.GET)
	public String zuzycieBj(ModelMap model) {

		return "dodajZuzycieBj";

	}	
	
	@RequestMapping(value = "/saveZuzycieBj", method = RequestMethod.POST)
	public ModelAndView saveZuzycieBj(@ModelAttribute("command") ZuzycieBj zuzycieBj, 
			BindingResult result){
		zuzycieBj.setRokBudowy(zuzycieBj.getRokBudowy());
		zuzycieBj.setStanBudynku(zuzycieBj.getStanBudynku());
		zuzycieBj.setZuzycieFinalne(zuzycieBj.getZuzycieFinalne());
		zuzycieBj.setZuzycieBaP(zuzycieBj.getZuzycieBaP());
		zuzycieBj.setZuzycieCO(zuzycieBj.getZuzycieCO());
		zuzycieBj.setZuzycieCO2(zuzycieBj.getZuzycieCO2());
		zuzycieBj.setZuzycieNox(zuzycieBj.getZuzycieNox());
		zuzycieBj.setZuzyciePyl(zuzycieBj.getZuzyciePyl());
		zuzycieBj.setZuzycieSO2(zuzycieBj.getZuzycieSO2());
		zuzycieBj.setZuzycieRok(zuzycieBj.getZuzycieRok());
		zuzycieBj.setBjId(zuzycieBj.getBjId());
		zuzycieBjService.addZuzycieBj(zuzycieBj);
		return new ModelAndView("redirect:/zuzycieBj.html");		
	}
	
	
}
