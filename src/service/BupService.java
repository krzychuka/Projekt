package service;

import java.util.List;

import model.Bup;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import dao.BupDao;

@Service("bupService")
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
public class BupService {
	
	@Autowired
	private BupDao bupDao;

	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	public void addBup(Bup bup){
		bupDao.addBup(bup);
	}
	
	public List<Bup> bupList(){
		return bupDao.bupList();
	}
	
	public Bup getBup(long bupId){
		return bupDao.getBup(bupId);
	}
	
	public void deleteBup(Bup bup){
		bupDao.deleteBup(bup);
	}
}
