package controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class TestClass{
	
	@RequestMapping(value = "/index.html", method = RequestMethod.GET)
	public String printMessage(ModelMap model) {

		return "index";

	}
	
	@RequestMapping(value = "/welcome.html", method = RequestMethod.GET)
	public String printMessage1(ModelMap model) {

		return "welcome";

	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(ModelMap model) {

		return "login";

	}

	@RequestMapping(value = "/failLogin", method = RequestMethod.GET)
	public String failedLogin(ModelMap model) {

		model.addAttribute("error", "true");
		return "login";

	}

	@RequestMapping(value = "/logoff", method = RequestMethod.GET)
	public String logoff(ModelMap model) {

		return "login";

	}
	
	@RequestMapping(value = "/test.html", method = RequestMethod.GET)
	public String test(ModelMap model) {

		return "dodajTest";

	}
	
}
