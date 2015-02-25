package controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class Bie2013Controller {

	@RequestMapping(value = "/bie2013.html", method = RequestMethod.GET)
	public String listaBukip(ModelMap model) {

		return "bie2013";

	}
	
}
