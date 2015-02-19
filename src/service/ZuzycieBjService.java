package service;

import java.util.List;

import model.ZuzycieBj;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import dao.ZuzycieBjDao;

@Service("zuzycieBjService")
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
public class ZuzycieBjService {
	
	@Autowired
	private ZuzycieBjDao zuzycieBjDao;

	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	public void addZuzycieBj(ZuzycieBj zuzycieBj){
		zuzycieBjDao.addZuzycieBj(zuzycieBj);
	}
	
	public List<ZuzycieBj> zuzycieBjList(){
		return zuzycieBjDao.zuzycieBjList();
	}
	
	public ZuzycieBj getZuzycieBj(long bjId){
		return zuzycieBjDao.getZuzycieBj(bjId);
	}
	
	public void deleteZuzycieBj(ZuzycieBj zuzycieBj){
		zuzycieBjDao.deleteZuzycieBj(zuzycieBj);
	}
}
