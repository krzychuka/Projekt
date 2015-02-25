package controller;

import java.util.HashMap;
import java.util.Map;

import model.ZuzycieUrbisPwik;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import bean.ZuzycieUrbisPwikBean;
import service.ZuzycieUrbisPwikService;

@Controller
public class ZuzycieUrbisPwikController {

	@Autowired
	private ZuzycieUrbisPwikService zuzycieUrbisPwikService;
	
	@RequestMapping(value = "/zuzycieUrbisPwik", method = RequestMethod.GET)
	public ModelAndView zuzycieUrbisPwikModel(@ModelAttribute("command") ZuzycieUrbisPwikBean zuzycieUrbisPwikBean, BindingResult result) {

		return new ModelAndView("dodajZuzycieUrbisPwik");

	}	
	
	@RequestMapping(value = "/saveZuzycieUrbisPwik", method = RequestMethod.POST)
	public String saveZuzycieUrbisPwik(@ModelAttribute("command") ZuzycieUrbisPwikBean zuzycieUrbisPwikBean, 
			BindingResult result){
		if(result.hasErrors()){
			return "dodajZuzycieUrbisPwik";
		}else{
		ZuzycieUrbisPwik zuzycieUrbisPwik = prepareModel(zuzycieUrbisPwikBean);
		zuzycieUrbisPwikService.addZuzycieUrbisPwik(zuzycieUrbisPwik);
		return "welcome";		
	}
	}
	
	@RequestMapping(value = "/editZuzycieUrbisPwik", method = RequestMethod.GET)
	public ModelAndView editZuzycieUrbisPwik(
			@ModelAttribute("command") ZuzycieUrbisPwikBean zuzycieUrbisPwikBean, BindingResult result) {
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("zuzycieUrbisPwik", prepareZuzycieUrbisPwikBean(zuzycieUrbisPwikService.getZuzycieUrbisPwik(zuzycieUrbisPwikBean.getId())));
		return new ModelAndView("dodajZuzycieUrbisPwik", model);
	}

	private ZuzycieUrbisPwikBean prepareZuzycieUrbisPwikBean(ZuzycieUrbisPwik zuzycieUrbisPwik) {
		ZuzycieUrbisPwikBean bean =  new ZuzycieUrbisPwikBean();
		bean.setFinalne(zuzycieUrbisPwik.getZuzycieFinalne());
		bean.setsO2(zuzycieUrbisPwik.getZuzycieSO2());
		bean.setNox(zuzycieUrbisPwik.getZuzycieNox());
		bean.setcO2(zuzycieUrbisPwik.getZuzycieCO2());
		bean.setPyl(zuzycieUrbisPwik.getZuzyciePyl());
		bean.setcO(zuzycieUrbisPwik.getZuzycieCO());
		bean.setBaP(zuzycieUrbisPwik.getZuzycieBaP());
		bean.setRok(zuzycieUrbisPwik.getZuzycieRok());
		bean.setBeanUrbisPwikId(zuzycieUrbisPwik.getUrbisPwikId());
		bean.setId(zuzycieUrbisPwik.getZuzycieUrbisPwikId());
		return bean;
	}

	private ZuzycieUrbisPwik prepareModel(ZuzycieUrbisPwikBean zuzycieUrbisPwikBean) {
		ZuzycieUrbisPwik zuzycieUrbisPwik = new ZuzycieUrbisPwik();
		zuzycieUrbisPwik.setZuzycieFinalne(zuzycieUrbisPwikBean.getFinalne());
		zuzycieUrbisPwik.setZuzycieSO2(zuzycieUrbisPwikBean.getsO2());
		zuzycieUrbisPwik.setZuzycieNox(zuzycieUrbisPwikBean.getNox());
		zuzycieUrbisPwik.setZuzycieCO2(zuzycieUrbisPwikBean.getcO2());
		zuzycieUrbisPwik.setZuzyciePyl(zuzycieUrbisPwikBean.getPyl());
		zuzycieUrbisPwik.setZuzycieCO(zuzycieUrbisPwikBean.getcO());
		zuzycieUrbisPwik.setZuzycieBaP(zuzycieUrbisPwikBean.getBaP());
		zuzycieUrbisPwik.setZuzycieRok(zuzycieUrbisPwikBean.getRok());
		zuzycieUrbisPwik.setUrbisPwikId(zuzycieUrbisPwikBean.getBeanUrbisPwikId());
		zuzycieUrbisPwik.setZuzycieUrbisPwikId(zuzycieUrbisPwikBean.getId());
		zuzycieUrbisPwikBean.setId(null);
		return zuzycieUrbisPwik;
	}
}
