package app.dao;

import java.util.List;

import app.entities.ImageLink;

public interface ImageLinkDAO {
	public List<String> getAllImageProduct(Integer proId);
	/**
	 * Thêm một link ảnh
	 */
	public Boolean insertImagelink(ImageLink imageLink);

}
