package dao;

import java.util.List;

import model.Bj;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Transactional
@Repository("bjDao")
public class BjDao {

	@Autowired
	private SessionFactory sessionFactory;

	public void addBj(Bj bj){
		sessionFactory.getCurrentSession().saveOrUpdate(bj);
	}
	
	@SuppressWarnings("unchecked")
	public List<Bj> bjList(){
		return (List<Bj>) sessionFactory.getCurrentSession().createCriteria(Bj.class).list();
	}
	
	public Bj getBj(Long bjId){
		return (Bj) sessionFactory.getCurrentSession().get(Bj.class, bjId);
 	}
	
	public void deleteBj(Bj bj){
		sessionFactory.getCurrentSession().createQuery("DELETE FROM Bj WHERE bjId = " + bj.getBjId()).executeUpdate();
	}
}
