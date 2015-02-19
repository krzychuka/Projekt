package service;

import java.util.List;

import model.Bj;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import dao.BjDao;

@Service("bjService")
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
public class BjService {
	
	@Autowired
	private BjDao bjDao;

	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	public void addBj(Bj bj){
		bjDao.addBj(bj);
	}
	
	public List<Bj> bjList(){
		return bjDao.bjList();
	}
	
	public Bj getBj(long bjId){
		return bjDao.getBj(bjId);
	}
	
	public void deleteBj(Bj bj){
		bjDao.deleteBj(bj);
	}
}

