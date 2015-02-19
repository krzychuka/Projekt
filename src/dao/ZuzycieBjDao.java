package dao;

import java.util.List;

import model.ZuzycieBj;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Transactional
@Repository("zuzycieBjDao")
public class ZuzycieBjDao {

	@Autowired
	private SessionFactory sessionFactory;

	public void addZuzycieBj(ZuzycieBj zuzycieBj){
		sessionFactory.getCurrentSession().saveOrUpdate(zuzycieBj);
	}
	
	@SuppressWarnings("unchecked")
	public List<ZuzycieBj> zuzycieBjList(){
		return (List<ZuzycieBj>) sessionFactory.getCurrentSession().createCriteria(ZuzycieBj.class).list();
	}
	
	public ZuzycieBj getZuzycieBj(Long bjId){
		return (ZuzycieBj) sessionFactory.getCurrentSession().get(ZuzycieBj.class, bjId);
 	}
	
	public void deleteZuzycieBj(ZuzycieBj zuzycieBj){
		sessionFactory.getCurrentSession().createQuery("DELETE FROM ZuzycieBj WHERE bjId = " + zuzycieBj.getBjId()).executeUpdate();
	}
}
