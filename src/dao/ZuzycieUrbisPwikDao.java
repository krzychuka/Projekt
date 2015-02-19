package dao;

import java.util.List;

import model.ZuzycieUrbisPwik;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Transactional
@Repository("zuzycieUrbisPwikDao")
public class ZuzycieUrbisPwikDao {

	@Autowired
	private SessionFactory sessionFactory;

	public void addZuzycieUrbisPwik(ZuzycieUrbisPwik zuzycieUrbisPwik){
		sessionFactory.getCurrentSession().saveOrUpdate(zuzycieUrbisPwik);
	}
	
	@SuppressWarnings("unchecked")
	public List<ZuzycieUrbisPwik> zuzycieUrbisPwikList(){
		return (List<ZuzycieUrbisPwik>) sessionFactory.getCurrentSession().createCriteria(ZuzycieUrbisPwik.class).list();
	}
	
	public ZuzycieUrbisPwik getZuzycieUrbisPwik(Long urbisPwikId){
		return (ZuzycieUrbisPwik) sessionFactory.getCurrentSession().get(ZuzycieUrbisPwik.class, urbisPwikId);
 	}
	
	public void deleteZuzycieUrbisPwik(ZuzycieUrbisPwik zuzycieUrbisPwik){
		sessionFactory.getCurrentSession().createQuery("DELETE FROM ZuzycieUrbisPwik WHERE urbisPwikId = " + zuzycieUrbisPwik.getUrbisPwikId()).executeUpdate();
	}
}

