package dao;

import java.util.List;

import model.ZuzycieBup;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Transactional
@Repository("zuzycieBupDao")
public class ZuzycieBupDao {

	@Autowired
	private SessionFactory sessionFactory;

	public void addZuzycieBup(ZuzycieBup zuzycieBup){
		sessionFactory.getCurrentSession().saveOrUpdate(zuzycieBup);
	}
	
	@SuppressWarnings("unchecked")
	public List<ZuzycieBup> zuzycieBupList(){
		return (List<ZuzycieBup>) sessionFactory.getCurrentSession().createCriteria(ZuzycieBup.class).list();
	}
	
	public ZuzycieBup getZuzycieBup(Long bupId){
		return (ZuzycieBup) sessionFactory.getCurrentSession().get(ZuzycieBup.class, bupId);
 	}
	
	public void deleteZuzycieBup(ZuzycieBup zuzycieBup){
		sessionFactory.getCurrentSession().createQuery("DELETE FROM ZuzycieBup WHERE bupId = " + zuzycieBup.getBupId()).executeUpdate();
	}
}