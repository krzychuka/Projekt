package controller;

import model.Bj;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import service.BjService;

@Controller
public class BjController {
	
	@Autowired
	private BjService bjService;

	@RequestMapping(value = "/bj.html", method = RequestMethod.GET)
	public String dodajBj(ModelMap model) {

		return "dodajBj";

	}	
	
	@RequestMapping(value = "/listaBj.html", method = RequestMethod.GET)
	public String listaBj(ModelMap model) {

		return "listaBj";

	}
	
	@RequestMapping(value = "/saveBj", method = RequestMethod.POST)
	public ModelAndView saveBj(@ModelAttribute("command") Bj bj, BindingResult result){
		bj.setSposobOgrzewania(bj.getSposobOgrzewania());
		bj.setSposobPrzygotowaniaCWU(bj.getSposobPrzygotowaniaCWU());
		bjService.addBj(bj);
		return new ModelAndView("redirect:/bj.html");
	}
}
