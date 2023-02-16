package app.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import app.dao.CataLogsDAO;
import app.entities.CataLogs;

@Repository
public class CatalogsDAOimpl implements CataLogsDAO{
	
	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public List<CataLogs> getAllCataLog() {
		Session session = sessionFactory.openSession();
		try {
			List list = session.createQuery("from CataLogs catalogs where catalogs.status = 1")
					.list();
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return null;
	}

	@Override
	public boolean insertCatalog(CataLogs cataLogs) {
		Session session = sessionFactory.openSession();
		try {
			session.beginTransaction();
			session.save(cataLogs);
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
	public boolean UpdateCatalog(CataLogs cataLogs) {
		Session session = sessionFactory.openSession();
		try {
			session.beginTransaction();
			session.update(cataLogs);
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
	public CataLogs getCatalogsById(Integer Id) {
		Session session = sessionFactory.openSession();
		try {
			CataLogs catalogs = session.get(CataLogs.class, Id);
			return catalogs;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			session.close();
		}
		return null;
	}

	@Override
	public boolean checkCatalogNameExsit(String catalogName) {
		Session session = sessionFactory.openSession();
		try {
			List list = session
					.createQuery(
							"from CataLogs catalogs where catalogs.status = 1 and catalogs.catalogName = :catalogName")
					.setParameter("catalogName", catalogName).list();
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
