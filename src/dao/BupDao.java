package dao;

import java.util.List;

import model.Bup;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Transactional
@Repository("bupDao")
public class BupDao {

	@Autowired
	private SessionFactory sessionFactory;

	public void addBup(Bup bup){
		sessionFactory.getCurrentSession().saveOrUpdate(bup);
	}
	
	@SuppressWarnings("unchecked")
	public List<Bup> bupList(){
		return (List<Bup>) sessionFactory.getCurrentSession().createCriteria(Bup.class).list();
	}
	
	public Bup getBup(Long bupId){
		return (Bup) sessionFactory.getCurrentSession().get(Bup.class, bupId);
 	}
	
	public void deleteBup(Bup bup){
		sessionFactory.getCurrentSession().createQuery("DELETE FROM Bup WHERE bupId = " + bup.getBupId()).executeUpdate();
	}
}
