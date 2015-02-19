package controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class Biznes2013Controller {

		@RequestMapping(value = "/biznes2013.html", method = RequestMethod.GET)
		public String listaBukip(ModelMap model) {

			return "biznes2013";

		}
}
