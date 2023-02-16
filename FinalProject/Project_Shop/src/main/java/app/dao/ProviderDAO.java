package app.dao;

import java.util.List;

import app.entities.Provider;

public interface ProviderDAO {
	/**
     * Lấy danh sách tất cả provider
     * @return list provider
     */
	public List<Provider> getAllProvider();
	
	/**
     * Thêm mới danh một nhà sản xuất
     * @return boolean
     */
	public boolean insertProvider(Provider provider);
	
	/**
     * Cập nhật danh một nhà sản xuất
     * @return boolean
     */
	public boolean updateProvider(Provider provider);
	
	/**
     * Xem chi tiết một danh mục theo id
     * @return provider
     */
	public Provider getProviderById(Integer Id);
	
	/**
	 *  kiểm tra xem tên nhà sản xuất đã tồn tại hay chưa
	 * @param providerName
	 * @return boolean
	 */
	public boolean checkProviderNameExsit(String providerName);
}
