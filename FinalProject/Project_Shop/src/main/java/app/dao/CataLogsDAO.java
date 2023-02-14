package app.dao;

import java.util.List;

import app.entities.CataLogs;


public interface CataLogsDAO {
	/**
     * Lấy danh sách tất cả catalog
     * @return list provider
     */
	public List<CataLogs> getAllCataLog();
	
	/**
     * Tìm một danh mục theo id
     * @return catalog
     */
	public CataLogs getCatalogsById(Integer Id);
	
	/**
     * Thêm mới một catalog
     * @return boolean
     */
	public boolean insertCatalog(CataLogs cataLogs);
	
	/**
     * Cập nhật một catalog
     * @return boolean
     */
	public boolean UpdateCatalog(CataLogs cataLogs);
	
}
