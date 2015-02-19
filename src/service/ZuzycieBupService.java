package service;

import java.util.List;

import model.ZuzycieBup;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import dao.ZuzycieBupDao;

@Service("zuzycieBupService")
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
public class ZuzycieBupService {
	
	@Autowired
	private ZuzycieBupDao zuzycieBupDao;

	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	public void addZuzycieBup(ZuzycieBup zuzycieBup){
		zuzycieBupDao.addZuzycieBup(zuzycieBup);
	}
	
	public List<ZuzycieBup> zuzycieBupList(){
		return zuzycieBupDao.zuzycieBupList();
	}
	
	public ZuzycieBup getZuzycieBup(long bupId){
		return zuzycieBupDao.getZuzycieBup(bupId);
	}
	
	public void deleteZuzycieBup(ZuzycieBup zuzycieBup){
		zuzycieBupDao.deleteZuzycieBup(zuzycieBup);
	}
}
