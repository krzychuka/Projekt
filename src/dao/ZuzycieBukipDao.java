package dao;

import java.util.List;

import model.ZuzycieBukip;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Transactional
@Repository("zuzycieBukipDao")
public class ZuzycieBukipDao {

	@Autowired
	private SessionFactory sessionFactory;

	public void addZuzycieBukip(ZuzycieBukip zuzycieBukip){
		sessionFactory.getCurrentSession().saveOrUpdate(zuzycieBukip);
	}
	
	@SuppressWarnings("unchecked")
	public List<ZuzycieBukip> zuzycieBukipList(){
		return (List<ZuzycieBukip>) sessionFactory.getCurrentSession().createCriteria(ZuzycieBukip.class).list();
	}
	
	public ZuzycieBukip getZuzycieBukip(Long bukipId){
		return (ZuzycieBukip) sessionFactory.getCurrentSession().get(ZuzycieBukip.class, bukipId);
 	}
	
	public void deleteZuzycieBukip(ZuzycieBukip zuzycieBukip){
		sessionFactory.getCurrentSession().createQuery("DELETE FROM ZuzycieBukip WHERE bukipId = " + zuzycieBukip.getBukipId()).executeUpdate();
	}
}
