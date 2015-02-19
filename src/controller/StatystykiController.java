package controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class StatystykiController {
	
	@RequestMapping(value = "/calkowiteZuzycie.html", method = RequestMethod.GET)
	public String calkowiteZuzycie(ModelMap model) {

		return "calkowiteZuzycie";

	}
	
	@RequestMapping(value = "/calkowiteKoszty.html", method = RequestMethod.GET)
	public String calkowiteKoszty(ModelMap model) {

		return "calkowiteKoszty";

	}
	
	@RequestMapping(value = "/jednostkoweZuzycie.html", method = RequestMethod.GET)
	public String jednostkoweZuzycie(ModelMap model) {

		return "jednostkoweZuzycie";

	}
	
	@RequestMapping(value = "/jednostkoweKoszty.html", method = RequestMethod.GET)
	public String jednostkoweKoszty(ModelMap model) {

		return "jednostkoweKoszty";

	}

}
