package app.dao;

import java.util.List;

import app.entities.Color;

public interface ColorDAO {
	/**
	 * Lấy tất cả các màu
	 */
	public List<Color> getAllColor();
	
	/**
	 * Thêm mới màu sắc
	 */
	public boolean insertColor(Color color);
	
	/**
	 * Cập Nhật Màu Sắc
	 */
	public boolean updateColor(Color color);
	
	/**
	 * Kiểm tra màu sắc đã tồn tại chưa
	 */
	public boolean checkColorName(String colorName);
	
	/**
	 * Tìm kiếm một màu sắc theo id
	 */
	public Color getColorById(Integer Id);
}
