package dao;

import java.util.List;

import model.Bukip;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Transactional
@Repository("bukipDao")
public class BukipDao {

	@Autowired
	private SessionFactory sessionFactory;

	public void addBukip(Bukip bukip){
		sessionFactory.getCurrentSession().saveOrUpdate(bukip);
	}
	
	@SuppressWarnings("unchecked")
	public List<Bukip> bukipList(){
		return (List<Bukip>) sessionFactory.getCurrentSession().createCriteria(Bukip.class).list();
	}
	
	public Bukip getBukip(Long bukipId){
		return (Bukip) sessionFactory.getCurrentSession().get(Bukip.class, bukipId);
 	}
	
	public void deleteBukip(Bukip bukip){
		sessionFactory.getCurrentSession().createQuery("DELETE FROM Bukip WHERE bukipId = " + bukip.getBukipId()).executeUpdate();
	}
}
