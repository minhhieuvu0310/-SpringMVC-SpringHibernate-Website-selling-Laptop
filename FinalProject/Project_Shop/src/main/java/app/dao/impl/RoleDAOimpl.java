package app.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import app.dao.RoleDAO;
import app.entities.Role;
import app.entities.Users;

@Repository
public class RoleDAOimpl implements RoleDAO{
	
	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public List<Role> getAllRole() {
		Session session = sessionFactory.openSession();
		try {
			List list = session.createQuery("from Role role where role.status = 1").list();
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return null;
	}

	@Override
	public boolean insertRole(Role role) {
		Session session = sessionFactory.openSession();
		try {
			session.beginTransaction();
			session.save(role);
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
	public boolean updateRole(Role role) {
		Session session = sessionFactory.openSession();
		try {
			session.beginTransaction();
			session.update(role);
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
	public Role getRoleById(Integer Id) {
		Session session = sessionFactory.openSession();
		try {
			Role role = session.get(Role.class,Id);
			return role;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return null;
	}

	@Override
	public boolean checkRoleName(Role role) {
		Session session = sessionFactory.openSession();
		try {
			List list = session.createQuery("from Role role where role.roleName = :roleName")
					.setParameter("roleName", role.getRoleName())
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

}
