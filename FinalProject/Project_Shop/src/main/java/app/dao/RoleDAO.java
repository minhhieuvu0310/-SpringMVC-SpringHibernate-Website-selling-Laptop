package app.dao;

import java.util.List;

import app.entities.Role;

public interface RoleDAO {
	/**
	 * Lấy tất cả các role
	 */
	public List<Role> getAllRole();
	
	/**
	 * Thêm một role mới
	 */
	public boolean insertRole(Role role);
	
	/**
	 * Cập nhât một role
	 */
	public boolean updateRole(Role role);
	
	/**
	 * Lấy một Role theo Id
	 */
	public Role getRoleById(Integer Id);
	
	/**
	 * Kiểm tra tên Role đã tồn tại chưa
	 * @param role
	 * @return
	 */
	public boolean checkRoleName(Role role);

}
