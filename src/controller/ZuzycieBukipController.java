package controller;

import java.util.HashMap;
import java.util.Map;

import model.ZuzycieBukip;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import bean.ZuzycieBukipBean;
import service.ZuzycieBukipService;

@Controller
public class ZuzycieBukipController {
	
	@Autowired
	private ZuzycieBukipService zuzycieBukipService;
	
	@RequestMapping(value = "/zuzycieBukip", method = RequestMethod.GET)
	public ModelAndView zuzycieBukipModel(@ModelAttribute("command") ZuzycieBukipBean zuzycieBukipBean, BindingResult result) {

		return new ModelAndView("dodajZuzycieBukip");

	}	
	
	@RequestMapping(value = "/saveZuzycieBukip", method = RequestMethod.POST)
	public String saveZuzycieBukip(@ModelAttribute("command") ZuzycieBukipBean zuzycieBukipBean, 
			BindingResult result){
		if(result.hasErrors()){
			return "dodajZuzycieBukip";
		}else{
		ZuzycieBukip zuzycieBukip = prepareModel(zuzycieBukipBean);
		zuzycieBukipService.addZuzycieBukip(zuzycieBukip);
		return "welcome";		
	}
	}
	
	@RequestMapping(value = "/editZuzycieBukip", method = RequestMethod.GET)
	public ModelAndView editZuzycieBukip(
			@ModelAttribute("command") ZuzycieBukipBean zuzycieBukipBean, BindingResult result) {
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("zuzycieBukip", prepareZuzycieBukipBean(zuzycieBukipService.getZuzycieBukip(zuzycieBukipBean.getId())));
		return new ModelAndView("dodajZuzycieBukip", model);
	}

	private ZuzycieBukipBean prepareZuzycieBukipBean(ZuzycieBukip zuzycieBukip) {
		ZuzycieBukipBean bean =  new ZuzycieBukipBean();
		bean.setFinalne(zuzycieBukip.getZuzycieFinalne());
		bean.setsO2(zuzycieBukip.getZuzycieSO2());
		bean.setNox(zuzycieBukip.getZuzycieNox());
		bean.setcO2(zuzycieBukip.getZuzycieCO2());
		bean.setPyl(zuzycieBukip.getZuzyciePyl());
		bean.setcO(zuzycieBukip.getZuzycieCO());
		bean.setBaP(zuzycieBukip.getZuzycieBaP());
		bean.setRok(zuzycieBukip.getZuzycieRok());
		bean.setBeanBukipId(zuzycieBukip.getBukipId());
		bean.setId(zuzycieBukip.getZuzycieBukipId());
		return bean;
	}

	private ZuzycieBukip prepareModel(ZuzycieBukipBean zuzycieBukipBean) {
		ZuzycieBukip zuzycieBukip = new ZuzycieBukip();
		zuzycieBukip.setZuzycieFinalne(zuzycieBukipBean.getFinalne());
		zuzycieBukip.setZuzycieSO2(zuzycieBukipBean.getsO2());
		zuzycieBukip.setZuzycieNox(zuzycieBukipBean.getNox());
		zuzycieBukip.setZuzycieCO2(zuzycieBukipBean.getcO2());
		zuzycieBukip.setZuzyciePyl(zuzycieBukipBean.getPyl());
		zuzycieBukip.setZuzycieCO(zuzycieBukipBean.getcO());
		zuzycieBukip.setZuzycieBaP(zuzycieBukipBean.getBaP());
		zuzycieBukip.setZuzycieRok(zuzycieBukipBean.getRok());
		zuzycieBukip.setBukipId(zuzycieBukipBean.getBeanBukipId());
		zuzycieBukip.setZuzycieBukipId(zuzycieBukipBean.getId());
		zuzycieBukipBean.setId(null);
		return zuzycieBukip;
	}
	
	
}
