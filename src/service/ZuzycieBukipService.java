package service;

import java.util.List;

import model.ZuzycieBukip;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import dao.ZuzycieBukipDao;

@Service("zuzycieBukipService")
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
public class ZuzycieBukipService {
	
	@Autowired
	private ZuzycieBukipDao zuzycieBukipDao;

	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	public void addZuzycieBukip(ZuzycieBukip zuzycieBukip){
		zuzycieBukipDao.addZuzycieBukip(zuzycieBukip);
	}
	
	public List<ZuzycieBukip> zuzycieBukipList(){
		return zuzycieBukipDao.zuzycieBukipList();
	}
	
	public ZuzycieBukip getZuzycieBukip(long bupId){
		return zuzycieBukipDao.getZuzycieBukip(bupId);
	}
	
	public void deleteZuzycieBukip(ZuzycieBukip zuzycieBukip){
		zuzycieBukipDao.deleteZuzycieBukip(zuzycieBukip);
	}
}