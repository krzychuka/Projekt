package controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

	@Controller
	public class OswietlenieController {

		@RequestMapping(value = "/oswietlenie.html", method = RequestMethod.GET)
		public String listaBukip(ModelMap model) {

			return "oswietlenie";

		}
}

