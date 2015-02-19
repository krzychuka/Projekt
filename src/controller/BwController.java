package controller;

import model.Bw;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import service.BwService;

@Controller
public class BwController {

	@Autowired
	private BwService bwService;
	
	@RequestMapping(value = "/bw.html", method = RequestMethod.GET)
	public String dodajBw(ModelMap model) {

		return "dodajBw";

	}	
	
	@RequestMapping(value = "/listaBw.html", method = RequestMethod.GET)
	public String listaBw(ModelMap model) {

		return "listaBw";

	}
	
	@RequestMapping(value = "/saveBw", method = RequestMethod.POST)
	public ModelAndView saveBw(@ModelAttribute("command") Bw bw, BindingResult result){
		bw.setAdres(bw.getAdres());
		bw.setPowierzchnia(bw.getPowierzchnia());
		bw.setKubatura(bw.getKubatura());
		bwService.addBw(bw);
		return new ModelAndView("redirect:/bw.html");
	}
}
