package service;

import java.util.List;

import model.Bw;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import dao.BwDao;

@Service("bwService")
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
public class BwService {
	
	@Autowired
	private BwDao bwDao;

	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	public void addBw(Bw bw){
		bwDao.addBw(bw);
	}
	
	public List<Bw> bwList(){
		return bwDao.bwList();
	}
	
	public Bw getBw(long bwId){
		return bwDao.getBw(bwId);
	}
	
	public void deleteBw(Bw bw){
		bwDao.deleteBw(bw);
	}
}
