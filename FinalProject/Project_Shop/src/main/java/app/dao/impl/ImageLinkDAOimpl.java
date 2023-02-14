package app.dao.impl;

import java.util.List;


import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import app.dao.ImageLinkDAO;
import app.entities.ImageLink;


@Repository
public class ImageLinkDAOimpl implements ImageLinkDAO{
	
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public List<String> getAllImageProduct(Integer proId) {
		Session session = sessionFactory.openSession();
		try {
			List list = session
					.createQuery(
							"select imageLink.imageLinkName from ImageLink imageLink where product.productId = :proId and imageLink.status = 1")
					.setParameter("proId", proId).list();
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return null;
	}

	@Override
	public Boolean insertImagelink(ImageLink imageLink) {
		Session session = sessionFactory.openSession();
		try {
			session.beginTransaction();
			session.save(imageLink);
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

}
