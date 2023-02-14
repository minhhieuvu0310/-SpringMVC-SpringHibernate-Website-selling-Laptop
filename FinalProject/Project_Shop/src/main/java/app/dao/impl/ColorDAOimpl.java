
package app.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import app.dao.ColorDAO;
import app.entities.Color;
import app.entities.Product;
import app.entities.Users;

@Repository
public class ColorDAOimpl implements ColorDAO{
	
	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public List<Color> getAllColor() {
		Session session = sessionFactory.openSession();
		try {
			List list = session.createQuery("from Color color where color.status = 1").list();
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return null;
	}
	
	@Override
	public boolean insertColor(Color color) {
		Session session = sessionFactory.openSession();
		try {
			session.beginTransaction();
			session.save(color);
			session.getTransaction().commit();
			return true;
		} catch (Exception e1) {
			// TODO: handle exception
			e1.printStackTrace();
			session.getTransaction().rollback();
		}finally {
			session.close();
		}
		return false;
	}

	@Override
	public boolean updateColor(Color color) {
		Session session = sessionFactory.openSession();
		try {
			session.beginTransaction();
			session.update(color);
			session.getTransaction().commit();
			return true;
		} catch (Exception e1) {
			// TODO: handle exception
			e1.printStackTrace();
			session.getTransaction().rollback();
		}finally {
			session.close();
		}
		return false;
	}

	@Override
	public boolean checkColorName(String colorName) {
		Session session = sessionFactory.openSession();
		try {
			List list = session.createQuery("from Color color where color.colorName = :colorName and color.status = 1")
					.setParameter("colorName", colorName)
					.list();
			if(list.size() > 0) return true;
			else return false;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return false;
	}

	@Override
	public Color getColorById(Integer Id) {
		Session session = sessionFactory.openSession();
		try {
			Color color = session.get(Color.class,Id);
			return color;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return null;
	}

}
