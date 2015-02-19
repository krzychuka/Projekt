package dao;

import java.util.List;

import model.UrbisPwik;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Transactional
@Repository("urbisPwikDao")
public class UrbisPwikDao {

	@Autowired
	private SessionFactory sessionFactory;

	public void addUrbisPwik(UrbisPwik urbisPwik){
		sessionFactory.getCurrentSession().saveOrUpdate(urbisPwik);
	}
	
	@SuppressWarnings("unchecked")
	public List<UrbisPwik> urbisPwikList(){
		return (List<UrbisPwik>) sessionFactory.getCurrentSession().createCriteria(UrbisPwik.class).list();
	}
	
	public UrbisPwik getUrbisPwik(Long urbisPwikId){
		return (UrbisPwik) sessionFactory.getCurrentSession().get(UrbisPwik.class, urbisPwikId);
 	}
	
	public void deleteUrbisPwik(UrbisPwik urbisPwik){
		sessionFactory.getCurrentSession().createQuery("DELETE FROM UrbisPwik WHERE urbisPwikId = " + urbisPwik.getUrbisPwikId()).executeUpdate();
	}
}
