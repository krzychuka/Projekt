package dao;

import java.util.List;

import model.ZuzycieBw;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Transactional
@Repository("zuzycieBwDao")
public class ZuzycieBwDao {

	@Autowired
	private SessionFactory sessionFactory;

	public void addZuzycieBw(ZuzycieBw zuzycieBw){
		sessionFactory.getCurrentSession().saveOrUpdate(zuzycieBw);
	}
	
	@SuppressWarnings("unchecked")
	public List<ZuzycieBw> zuzycieBwList(){
		return (List<ZuzycieBw>) sessionFactory.getCurrentSession().createCriteria(ZuzycieBw.class).list();
	}
	
	public ZuzycieBw getZuzycieBw(Long bwId){
		return (ZuzycieBw) sessionFactory.getCurrentSession().get(ZuzycieBw.class, bwId);
 	}
	
	public void deleteZuzycieBw(ZuzycieBw zuzycieBw){
		sessionFactory.getCurrentSession().createQuery("DELETE FROM ZuzycieBw WHERE bwId = " + zuzycieBw.getBwId()).executeUpdate();
	}
}
