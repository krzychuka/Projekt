package service;

import java.util.List;

import model.ZuzycieUrbisPwik;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import dao.ZuzycieUrbisPwikDao;

@Service("zuzycieUrbisPwikService")
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
public class ZuzycieUrbisPwikService {
	
	@Autowired
	private ZuzycieUrbisPwikDao zuzycieUrbisPwikDao;

	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	public void addZuzycieUrbisPwik(ZuzycieUrbisPwik zuzycieUrbisPwik){
		zuzycieUrbisPwikDao.addZuzycieUrbisPwik(zuzycieUrbisPwik);
	}
	
	public List<ZuzycieUrbisPwik> zuzycieUrbisPwikList(){
		return zuzycieUrbisPwikDao.zuzycieUrbisPwikList();
	}
	
	public ZuzycieUrbisPwik getZuzycieUrbisPwik(long bupId){
		return zuzycieUrbisPwikDao.getZuzycieUrbisPwik(bupId);
	}
	
	public void deleteZuzycieUrbisPwik(ZuzycieUrbisPwik zuzycieUrbisPwik){
		zuzycieUrbisPwikDao.deleteZuzycieUrbisPwik(zuzycieUrbisPwik);
	}
}
