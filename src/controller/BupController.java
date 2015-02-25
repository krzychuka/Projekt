package controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import model.Bup;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import bean.BupBean;
import service.BupService;
import service.ZuzycieBupService;

@Controller
public class BupController {

	@Autowired
	private BupService bupService;

	@Autowired
	private ZuzycieBupService zuzycieBupService;

	@RequestMapping(value = "/bup", method = RequestMethod.GET)
	public ModelAndView bupModel(@ModelAttribute("command") BupBean bupBean,
			BindingResult result) {

		return new ModelAndView("dodajBup");

	}

	@RequestMapping(value = "/otworzBup", method = RequestMethod.GET)
	public ModelAndView otworz(@ModelAttribute("command") BupBean bupBean,
			BindingResult result) {
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("bup", prepareBupBean(bupService.getBup(bupBean.getId())));
		return new ModelAndView("szczegolyBup", model);
	}

	@RequestMapping(value = "/bups", method = RequestMethod.GET)
	public ModelAndView listaBup() {
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("bups", prepareListOfBean(bupService.bupList()));
		return new ModelAndView("listaBup", model);
	}

	@RequestMapping(value = "/saveBup", method = RequestMethod.POST)
	public ModelAndView saveBup(@ModelAttribute("command") @Valid BupBean bupBean,
			BindingResult result) {
		if (result.hasErrors()) {
			return new ModelAndView("dodajBup");
		} else {
			Bup bup = prepareModel(bupBean);
			bupService.addBup(bup);
			return new ModelAndView("redirect:/bups.html");
		}
	}

	@RequestMapping(value = "/deleteBup", method = RequestMethod.GET)
	public ModelAndView deleteBup(@ModelAttribute("command") BupBean bupBean,
			BindingResult result) {
		bupService.deleteBup(prepareModel(bupBean));
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("dodajBup", null);
		return new ModelAndView("listaBup", model);
	}

	@RequestMapping(value = "/editBup", method = RequestMethod.GET)
	public ModelAndView editBup(@ModelAttribute("command") BupBean bupBean,
			BindingResult result) {
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("bup", prepareBupBean(bupService.getBup(bupBean.getId())));
		return new ModelAndView("dodajBup", model);
	}

	private BupBean prepareBupBean(Bup bup) {
		BupBean bean = new BupBean();
		bean.setNazwa(bup.getBupNazwa());
		bean.setAdres(bup.getBupAdres());
		bean.setLiczbaUzytkownikow(bup.getBupLiczbaUzytkownikow());
		bean.setPowierzchnia(bup.getBupPowierzchnia());
		bean.setId(bup.getBupId());
		return bean;
	}

	private Bup prepareModel(BupBean bupBean) {
		Bup bup = new Bup();
		bup.setBupNazwa(bupBean.getNazwa());
		bup.setBupAdres(bupBean.getAdres());
		bup.setBupLiczbaUzytkownikow(bupBean.getLiczbaUzytkownikow());
		bup.setBupPowierzchnia(bupBean.getPowierzchnia());
		bup.setBupId(bupBean.getId());
		bupBean.setId(null);
		return bup;
	}

	private List<BupBean> prepareListOfBean(List<Bup> bups) {
		List<BupBean> beans = null;
		if (bups != null && !bups.isEmpty()) {
			beans = new ArrayList<BupBean>();
			BupBean bean = null;
			for (Bup bup : bups) {
				bean = new BupBean();
				bean.setId(bup.getBupId());
				bean.setNazwa(bup.getBupNazwa());
				bean.setAdres(bup.getBupAdres());
				bean.setPowierzchnia(bup.getBupPowierzchnia());
				bean.setLiczbaUzytkownikow(bup.getBupLiczbaUzytkownikow());
				beans.add(bean);
			}
		}
		return beans;
	}

}
