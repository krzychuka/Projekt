package service;

import java.util.List;

import model.ZuzycieBw;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import dao.ZuzycieBwDao;

@Service("zuzycieBwService")
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
public class ZuzycieBwService {
	
	@Autowired
	private ZuzycieBwDao zuzycieBwDao;

	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	public void addZuzycieBw(ZuzycieBw zuzycieBw){
		zuzycieBwDao.addZuzycieBw(zuzycieBw);
	}
	
	public List<ZuzycieBw> zuzycieBwList(){
		return zuzycieBwDao.zuzycieBwList();
	}
	
	public ZuzycieBw getZuzycieBw(long bwId){
		return zuzycieBwDao.getZuzycieBw(bwId);
	}
	
	public void deleteZuzycieBw(ZuzycieBw zuzycieBw){
		zuzycieBwDao.deleteZuzycieBw(zuzycieBw);
	}
}
