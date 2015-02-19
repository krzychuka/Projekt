package service;

import java.util.List;

import model.UrbisPwik;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import dao.UrbisPwikDao;

@Service("urbisPwikService")
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
public class UrbisPwikService {
	
	@Autowired
	private UrbisPwikDao urbisPwikDao;

	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	public void addUrbisPwik(UrbisPwik urbisPwik){
		urbisPwikDao.addUrbisPwik(urbisPwik);
	}
	
	public List<UrbisPwik> urbisPwikList(){
		return urbisPwikDao.urbisPwikList();
	}
	
	public UrbisPwik getUrbisPwik(long urbisPwikId){
		return urbisPwikDao.getUrbisPwik(urbisPwikId);
	}
	
	public void deleteUrbisPwik(UrbisPwik urbisPwik){
		urbisPwikDao.deleteUrbisPwik(urbisPwik);
	}
}

