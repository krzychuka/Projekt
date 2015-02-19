package dao;

import java.util.List;

import model.Bw;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Transactional
@Repository("bwDao")
public class BwDao {

	@Autowired
	private SessionFactory sessionFactory;

	public void addBw(Bw bw){
		sessionFactory.getCurrentSession().saveOrUpdate(bw);
	}
	
	@SuppressWarnings("unchecked")
	public List<Bw> bwList(){
		return (List<Bw>) sessionFactory.getCurrentSession().createCriteria(Bw.class).list();
	}
	
	public Bw getBw(Long bwId){
		return (Bw) sessionFactory.getCurrentSession().get(Bw.class, bwId);
 	}
	
	public void deleteBw(Bw bw){
		sessionFactory.getCurrentSession().createQuery("DELETE FROM Bw WHERE bwId = " + bw.getBwId()).executeUpdate();
	}
}

