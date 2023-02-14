
package app.entities;

import java.util.Date;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

@Entity
@Table(name = "Product")
public class Product {
	@Id
	@Column(name = "productId")
	@NotNull(message = "Id Sản Phẩm Không Được Bỏ Trống")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer productId;

	@Column(name = "productName")
	@NotEmpty(message = "Tên Sản Phẩm Nhập Không Được Bỏ Trống")
	private String productName;

	@Column(name = "productContent")
	@NotEmpty(message = "Mô Tả Sản Phẩm Không Được Bỏ Trống")
	private String productContent;

	@Column(name = "productContentDetail")
	@NotEmpty(message = "Mô Tả Chi Tiết Sản Phẩm Không Được Bỏ Trống")
	private String productContentDetail;

	@Column(name = "images")
	private String images;
	@Column(name = "views")
	private Integer views;
	@Column(name = "buyItem")
	private Integer buyItem;

	@Column(name = "priceInput")
	@NotNull(message = "Giá Nhập Sản Phẩm Không Được Bỏ Trống")
	private Float priceInput;

	@Column(name = "priceOutput")
	@NotNull(message = "Giá Bán Sản Phẩm Không Được Bỏ Trống")
	private Float priceOutput;

	@Column(name = "quantity")
	@NotNull(message = "Số Lượng Sản Phẩm Không Được Bỏ Trống")
	private Integer quantity;

	@Column(name = "created")
	private Date created;

	@Column(name = "Discount")
	@NotNull(message = "Giảm Giá Sản Phẩm Không Được Bỏ Trống")
	@Min(0)
	@Max(1)
	private Float discount;
	@Column(name = "status")
	private Boolean status;

	@ManyToOne
	@JoinColumn(name = "providerId", referencedColumnName = "providerId")
	private Provider provider;
	@ManyToOne
	@JoinColumn(name = "catalogId", referencedColumnName = "catalogId")
	private CataLogs catalog;

	@OneToMany(mappedBy = "product", fetch = FetchType.EAGER)
	private Set<ProductColor> productColors;
	@OneToMany(mappedBy = "product", fetch = FetchType.EAGER)
	private Set<ImageLink> imagelink;
	@OneToMany(mappedBy = "product", fetch = FetchType.EAGER)
	private Set<Orderdetail> orderdetails;
	@OneToMany(mappedBy = "product", fetch = FetchType.EAGER)
	private Set<CartItem> cartItem;

	public Product() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Product(Integer productId, @NotEmpty(message = "Tên Sản Phẩm Nhập Không Được Bỏ Trống") String productName,
			@NotEmpty(message = "Mô Tả Sản Phẩm Không Được Bỏ Trống") String productContent,
			@NotEmpty(message = "Mô Tả Chi Tiết Sản Phẩm Không Được Bỏ Trống") String productContentDetail,
			String images, Integer views, Integer buyItem,
			@NotNull(message = "Giá Nhập Sản Phẩm Không Được Bỏ Trống") Float priceInput,
			@NotNull(message = "Giá Bán Sản Phẩm Không Được Bỏ Trống") Float priceOutput,
			@NotNull(message = "Số Lượng Sản Phẩm Không Được Bỏ Trống") Integer quantity, Date created,
			@NotNull(message = "Giảm Giá Sản Phẩm Không Được Bỏ Trống") Float discount, Boolean status,
			Provider provider, CataLogs catalog, Set<ProductColor> productColors, Set<ImageLink> imagelink,
			Set<Orderdetail> orderdetails, Set<CartItem> cartItem) {
		super();
		this.productId = productId;
		this.productName = productName;
		this.productContent = productContent;
		this.productContentDetail = productContentDetail;
		this.images = images;
		this.views = views;
		this.buyItem = buyItem;
		this.priceInput = priceInput;
		this.priceOutput = priceOutput;
		this.quantity = quantity;
		this.created = created;
		this.discount = discount;
		this.status = status;
		this.provider = provider;
		this.catalog = catalog;
		this.productColors = productColors;
		this.imagelink = imagelink;
		this.orderdetails = orderdetails;
		this.cartItem = cartItem;
	}

	public Integer getProductId() {
		return productId;
	}

	public void setProductId(Integer productId) {
		this.productId = productId;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getProductContent() {
		return productContent;
	}

	public void setProductContent(String productContent) {
		this.productContent = productContent;
	}

	public String getProductContentDetail() {
		return productContentDetail;
	}

	public void setProductContentDetail(String productContentDetail) {
		this.productContentDetail = productContentDetail;
	}

	public String getImages() {
		return images;
	}

	public void setImages(String images) {
		this.images = images;
	}

	public Integer getViews() {
		return views;
	}

	public void setViews(Integer views) {
		this.views = views;
	}

	public Integer getBuyItem() {
		return buyItem;
	}

	public void setBuyItem(Integer buyItem) {
		this.buyItem = buyItem;
	}

	public Float getPriceInput() {
		return priceInput;
	}

	public void setPriceInput(Float priceInput) {
		this.priceInput = priceInput;
	}

	public Float getPriceOutput() {
		return priceOutput;
	}

	public void setPriceOutput(Float priceOutput) {
		this.priceOutput = priceOutput;
	}

	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

	public Date getCreated() {
		return created;
	}

	public void setCreated(Date created) {
		this.created = created;
	}

	public Float getDiscount() {
		return discount;
	}

	public void setDiscount(Float discount) {
		this.discount = discount;
	}

	public Boolean getStatus() {
		return status;
	}

	public void setStatus(Boolean status) {
		this.status = status;
	}

	public Provider getProvider() {
		return provider;
	}

	public void setProvider(Provider provider) {
		this.provider = provider;
	}

	public CataLogs getCatalog() {
		return catalog;
	}

	public void setCatalog(CataLogs catalog) {
		this.catalog = catalog;
	}

	public Set<ProductColor> getProductColors() {
		return productColors;
	}

	public void setProductColors(Set<ProductColor> productColors) {
		this.productColors = productColors;
	}

	public Set<ImageLink> getImagelink() {
		return imagelink;
	}

	public void setImagelink(Set<ImageLink> imagelink) {
		this.imagelink = imagelink;
	}

	public Set<Orderdetail> getOrderdetails() {
		return orderdetails;
	}

	public void setOrderdetails(Set<Orderdetail> orderdetails) {
		this.orderdetails = orderdetails;
	}

	public Set<CartItem> getCartItem() {
		return cartItem;
	}

	public void setCartItem(Set<CartItem> cartItem) {
		this.cartItem = cartItem;
	}

	public Float getProductHasDiscount() {
		return priceOutput * (1 - discount);
	}

}
