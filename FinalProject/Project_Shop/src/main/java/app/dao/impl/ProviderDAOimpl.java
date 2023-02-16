package app.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import app.dao.ProviderDAO;
import app.entities.CataLogs;
import app.entities.Provider;

@Repository
public class ProviderDAOimpl implements ProviderDAO {
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public List<Provider> getAllProvider() {
		Session session = sessionFactory.openSession();
		try {
			List list = session.createQuery("from Provider provider where provider.status = 1").list();
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return null;
	}

	@Override
	public boolean insertProvider(Provider provider) {
		Session session = sessionFactory.openSession();
		try {
			session.beginTransaction();
			session.save(provider);
			session.getTransaction().commit();
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			session.getTransaction().rollback();
		} finally {
			session.close();
		}
		return false;
	}

	@Override
	public boolean updateProvider(Provider provider) {
		Session session = sessionFactory.openSession();
		try {
			session.beginTransaction();
			session.update(provider);
			session.getTransaction().commit();
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			session.getTransaction().rollback();
		} finally {
			session.close();
		}
		return false;
	}

	@Override
	public Provider getProviderById(Integer Id) {
		Session session = sessionFactory.openSession();
		try {
			Provider provider = session.get(Provider.class, Id);
			return provider;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			session.getTransaction().rollback();
		} finally {
			session.close();
		}
		return null;
	}

	@Override
	public boolean checkProviderNameExsit(String providerName) {
		Session session = sessionFactory.openSession();
		try {
			List list = session
					.createQuery(
							"from Provider provider where provider.status = 1 and provider.providerName = :providerName")
					.setParameter("providerName", providerName).list();
			if (list.size() > 0) {
				return true;
			} else
				return false;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return false;
	}
}
