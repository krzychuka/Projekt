package service;

import java.util.List;

import model.Bukip;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import dao.BukipDao;

@Service("bukipService")
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
public class BukipService {
	
	@Autowired
	private BukipDao bukipDao;

	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	public void addBukip(Bukip bukip){
		bukipDao.addBukip(bukip);
	}
	
	public List<Bukip> bukipList(){
		return bukipDao.bukipList();
	}
	
	public Bukip getBukip(long bukipId){
		return bukipDao.getBukip(bukipId);
	}
	
	public void deleteBukip(Bukip bukip){
		bukipDao.deleteBukip(bukip);
	}
}
