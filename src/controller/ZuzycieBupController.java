package controller;

import java.util.HashMap;
import java.util.Map;

import model.ZuzycieBup;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import bean.ZuzycieBupBean;
import service.ZuzycieBupService;

@Controller
public class ZuzycieBupController {
	
	@Autowired
	private ZuzycieBupService zuzycieBupService;
	
	@RequestMapping(value = "/zuzycieBup", method = RequestMethod.GET)
	public ModelAndView zuzycieBupModel(@ModelAttribute("command") ZuzycieBupBean zuzycieBupBean, BindingResult result) {

		return new ModelAndView("dodajZuzycieBup");

	}	
	
	@RequestMapping(value = "/saveZuzycieBup", method = RequestMethod.POST)
	public String saveZuzycieBup(@ModelAttribute("command") ZuzycieBupBean zuzycieBupBean, 
			BindingResult result){
		if(result.hasErrors()){
			return "dodajZuzycieBup";
		}else{
		ZuzycieBup zuzycieBup = prepareModel(zuzycieBupBean);
		zuzycieBupService.addZuzycieBup(zuzycieBup);
		return "welcome";		
	}
	}
	
	@RequestMapping(value = "/editZuzycieBup", method = RequestMethod.GET)
	public ModelAndView editZuzycieBup(
			@ModelAttribute("command") ZuzycieBupBean zuzycieBupBean, BindingResult result) {
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("zuzycieBup", prepareZuzycieBupBean(zuzycieBupService.getZuzycieBup(zuzycieBupBean.getId())));
		return new ModelAndView("dodajZuzycieBup", model);
	}

	private ZuzycieBupBean prepareZuzycieBupBean(ZuzycieBup zuzycieBup) {
		ZuzycieBupBean bean =  new ZuzycieBupBean();
		bean.setFinalne(zuzycieBup.getZuzycieFinalne());
		bean.setsO2(zuzycieBup.getZuzycieSO2());
		bean.setNox(zuzycieBup.getZuzycieNox());
		bean.setcO2(zuzycieBup.getZuzycieCO2());
		bean.setPyl(zuzycieBup.getZuzyciePyl());
		bean.setcO(zuzycieBup.getZuzycieCO());
		bean.setBaP(zuzycieBup.getZuzycieBaP());
		bean.setRok(zuzycieBup.getZuzycieRok());
		bean.setBeanBupId(zuzycieBup.getBupId());
		bean.setId(zuzycieBup.getZuzycieBupId());
		return bean;
	}

	private ZuzycieBup prepareModel(ZuzycieBupBean zuzycieBupBean) {
		ZuzycieBup zuzycieBup = new ZuzycieBup();
		zuzycieBup.setZuzycieFinalne(zuzycieBupBean.getFinalne());
		zuzycieBup.setZuzycieSO2(zuzycieBupBean.getsO2());
		zuzycieBup.setZuzycieNox(zuzycieBupBean.getNox());
		zuzycieBup.setZuzycieCO2(zuzycieBupBean.getcO2());
		zuzycieBup.setZuzyciePyl(zuzycieBupBean.getPyl());
		zuzycieBup.setZuzycieCO(zuzycieBupBean.getcO());
		zuzycieBup.setZuzycieBaP(zuzycieBupBean.getBaP());
		zuzycieBup.setZuzycieRok(zuzycieBupBean.getRok());
		zuzycieBup.setBupId(zuzycieBupBean.getBeanBupId());
		zuzycieBup.setZuzycieBupId(zuzycieBupBean.getId());
		zuzycieBupBean.setId(null);
		return zuzycieBup;
	}
	
	
}
