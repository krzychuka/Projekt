package controller;

import model.ZuzycieUrbisPwik;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import service.ZuzycieUrbisPwikService;

@Controller
public class ZuzycieUrbisPwikController {

	@Autowired
	private ZuzycieUrbisPwikService zuzycieUrbisPwikService;
	
	@RequestMapping(value = "/zuzycieUrbisPwik.html", method = RequestMethod.GET)
	public String zuzycieUrbisPwik(ModelMap model) {

		return "dodajZuzycieUrbisPwik";

	}
	
	@RequestMapping(value = "/saveZuzycieUrbisPwik", method = RequestMethod.POST)
	public ModelAndView saveZuzycieUrbisPwik(@ModelAttribute("command") ZuzycieUrbisPwik zuzycieUrbisPwik, 
			BindingResult result){
		zuzycieUrbisPwik.setZuzycieFinalne(zuzycieUrbisPwik.getZuzycieFinalne());
		zuzycieUrbisPwik.setZuzycieBaP(zuzycieUrbisPwik.getZuzycieBaP());
		zuzycieUrbisPwik.setZuzycieCO(zuzycieUrbisPwik.getZuzycieCO());
		zuzycieUrbisPwik.setZuzycieCO2(zuzycieUrbisPwik.getZuzycieCO2());
		zuzycieUrbisPwik.setZuzycieNox(zuzycieUrbisPwik.getZuzycieNox());
		zuzycieUrbisPwik.setZuzyciePyl(zuzycieUrbisPwik.getZuzyciePyl());
		zuzycieUrbisPwik.setZuzycieSO2(zuzycieUrbisPwik.getZuzycieSO2());
		zuzycieUrbisPwik.setZuzycieRok(zuzycieUrbisPwik.getZuzycieRok());
		zuzycieUrbisPwik.setUrbisPwikId(zuzycieUrbisPwik.getUrbisPwikId());
		zuzycieUrbisPwikService.addZuzycieUrbisPwik(zuzycieUrbisPwik);
		return new ModelAndView("redirect:/zuzycieUrbisPwik.html");		
	}
}
