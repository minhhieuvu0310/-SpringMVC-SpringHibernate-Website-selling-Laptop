package app.controller;

import java.io.File;
import java.io.IOException;
import java.math.BigDecimal;
import java.nio.file.Files;
import java.nio.file.StandardOpenOption;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.validation.BindingResult;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import javax.validation.Valid;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.nimbusds.oauth2.sdk.ParseException;

import app.dao.CartDAO;
import app.dao.CataLogsDAO;
import app.dao.ColorDAO;
import app.dao.ImageLinkDAO;
import app.dao.OrdersDAO;
import app.dao.ProductDAO;
import app.dao.ProviderDAO;
import app.dao.RoleDAO;
import app.dao.User_RoleDAO;
import app.dao.UsersDAO;
import app.entities.Cart;
import app.entities.CataLogs;
import app.entities.Color;
import app.entities.ImageLink;
import app.entities.Orders;
import app.entities.Product;
import app.entities.Provider;
import app.entities.Role;
import app.entities.User_Role;
import app.entities.Users;

@Controller
public class AdminController {
	@Autowired
	private UsersDAO usersDAO;

	@Autowired
	private User_RoleDAO user_roleDAO;

	@Autowired
	private CataLogsDAO cataLogsDAO;

	@Autowired
	private ProviderDAO providerDAO;

	@Autowired
	private ProductDAO productDAO;

	@Autowired
	private OrdersDAO ordersDAO;

	@Autowired
	private ImageLinkDAO imageLinkDAO;

	@Autowired
	private ColorDAO colorDAO;

	@Autowired
	private CartDAO cartDAO;

	@Autowired
	private RoleDAO roleDAO;

	/**
	 * Xử Lý Đăng Nhập Vào Trang Admin
	 * 
	 * @return
	 */
	@RequestMapping(value = "initBackendLogin")
	public String initBackendLogin(Model model) {
		Users users = new Users();
		model.addAttribute("users", users);
		return "admin/login";
	}

	/**
	 * Tiến Hành Đăng Nhập
	 */
	@RequestMapping(value = "backendLogin")
	public String BackendLogin(@ModelAttribute("users") Users users, HttpSession session, Model model) {
		boolean reslut = usersDAO.checkLogin(users);
		if (reslut) {
			Users user = usersDAO.getUsers(users);
			boolean reslut2 = user_roleDAO.checkRoleAdminOfUser(user);
			if (reslut2) {
				session.setAttribute("userNameAdmin", user.getFullName());
				session.setAttribute("userAdminImage", user.getUserImage());
				return "redirect:/homeBackend";
			} else {
				model.addAttribute("message", "Xin lỗi tài khoản của bạn không được phép truy cập.");
				return "admin/login";
			}
		} else {
			model.addAttribute("message", "Sai thông tin đăng nhập.");
			return "admin/login";
		}
	}

	/**
	 * Trang chủ Đăng Nhập
	 */
	@RequestMapping(value = "homeBackend")
	public String homeBackend(Model model, HttpSession session) {
		if (session.getAttribute("userNameAdmin") != null) {
			int totalUsers = usersDAO.getTotalUsers();
			Integer totalOrders = ordersDAO.getTotalOrders();
			List<Orders> allOrders = ordersDAO.getAllOrders();
			Float totalMoney = ordersDAO.getTotalMoney(allOrders);
			model.addAttribute("totalMoney", totalMoney);
			model.addAttribute("totalUsers", totalUsers);
			model.addAttribute("totalOrders", totalOrders);
			return "admin/index";
		} else {
			Users users = new Users();
			model.addAttribute("users", users);
			return "admin/login";
		}
	}

	/**
	 * Lấy Toàn bộ Danh Sách Danh Mục
	 */
	@RequestMapping(value = "getAllCatalog")
	public String getAllCatalog(Model model, HttpSession session) {
		if (session.getAttribute("userNameAdmin") != null) {
			List<CataLogs> allCataLog = cataLogsDAO.getAllCataLog();
			model.addAttribute("listCatalog", allCataLog);
			return "admin/catalogs";
		} else {
			Users users = new Users();
			model.addAttribute("users", users);
			return "admin/login";
		}

	}

	/**
	 * Xử lý trước khi thêm mới một danh mục
	 */
	@RequestMapping(value = "initInsertCatalog")
	public String initInsertCatalog(HttpSession session, Model model) {
		if (session.getAttribute("userNameAdmin") != null) {
			CataLogs cataLogs = new CataLogs();
			List<CataLogs> allCataLog = cataLogsDAO.getAllCataLog();
			model.addAttribute("newcatalogs", cataLogs);
			model.addAttribute("listCatalog", allCataLog);
			return "admin/insertCatalog";
		} else {
			Users users = new Users();
			model.addAttribute("users", users);
			return "admin/login";
		}
	}

	/**
	 * Thêm một danh mục mới vào database
	 */
	@RequestMapping(value = "insertCatalog")
	public String insertCatalog(Model model, @ModelAttribute("newcatalogs") CataLogs newcatalogs) {
		newcatalogs.setStatus(true);
		boolean check = cataLogsDAO.insertCatalog(newcatalogs);
		if (check) {
			return "redirect:/getAllCatalog";
		} else {
			model.addAttribute("message", "Thêm mới không thành công");
			return "admin/insertCatalog";
		}
	}

	/**
	 * Xem chi tiết 1 danh mục
	 */
	@RequestMapping(value = "viewCatalog")
	public String viewCatalog(@RequestParam("Id") Integer id, Model model) {
		CataLogs catalog = cataLogsDAO.getCatalogsById(id);
		model.addAttribute("catalog", catalog);
		return "admin/catalogDetail";
	}

	/**
	 * Xử lý trước khi sửa danh mục
	 */
	@RequestMapping(value = "initUpdateCatalog")
	public String initUpdateCatalog(Model model, @RequestParam("Id") Integer id) {
		CataLogs catalogs = cataLogsDAO.getCatalogsById(id);
		List<CataLogs> allCataLog = cataLogsDAO.getAllCataLog();
		model.addAttribute("catalogs", catalogs);
		model.addAttribute("listCatalog", allCataLog);
		return "admin/updateCatalog";
	}

	/**
	 * Xử lý Cập Nhật Danh Mục
	 */
	@RequestMapping(value = "updateCatalog")
	public String updateCatalog(Model model, @ModelAttribute(name = "catalogs") CataLogs catalogs) {
		boolean result = false;
		result = cataLogsDAO.UpdateCatalog(catalogs);
		if (result) {
			return "redirect:/getAllCatalog";
		} else {
			model.addAttribute("message", "Cập Nhật Danh Mục Không Thành Công.");
			return "admin/updateCatalog";
		}
	}

	/**
	 * Xử lý khi ấn nút xóa Danh Mục
	 */
	@RequestMapping(value = "deleteCatalog")
	public String deleteCatalog(Model model, @RequestParam("Id") Integer id, HttpSession session) {
		if (session.getAttribute("userNameAdmin") != null) {
			CataLogs catalogs = cataLogsDAO.getCatalogsById(id);
			catalogs.setStatus(false);
			boolean result = cataLogsDAO.UpdateCatalog(catalogs);
			if (result) {
				return "redirect:getAllCatalog";
			} else {
				return "admin/Error";
			}
		} else {
			return "redirect:/initBackendLogin";
		}
	}

	/**
	 * Lấy Toàn bộ Danh Sách Nhà Sản Xuất
	 */
	@RequestMapping(value = "getAllProvider")
	public String getAllProvider(Model model, HttpSession session) {
		if (session.getAttribute("userNameAdmin") != null) {
			List<Provider> allProvider = providerDAO.getAllProvider();
			model.addAttribute("listProvider", allProvider);
			return "admin/provider";
		} else {
			Users users = new Users();
			model.addAttribute("users", users);
			return "admin/login";
		}

	}

	/**
	 * Xử lý trước khi thêm mới một nhà sản xuất
	 */
	@RequestMapping(value = "initInsertProvider")
	public String initInsertProvider(HttpSession session, Model model) {
		if (session.getAttribute("userNameAdmin") != null) {
			Provider provider = new Provider();
			model.addAttribute("newprovider", provider);
			return "admin/insertProvider";
		} else {
			Users users = new Users();
			model.addAttribute("users", users);
			return "admin/login";
		}
	}

	/**
	 * Thêm một nhà sản xuất mới vào database
	 */
	@RequestMapping(value = "insertProvider")
	public String insertProvider(Model model, @ModelAttribute("newprovider") Provider newprovider) {
		newprovider.setStatus(true);
		boolean result = providerDAO.insertProvider(newprovider);
		if (result) {
			return "redirect:/getAllProvider";
		} else {
			model.addAttribute("message", "Thêm mới không thành công");
			return "admin/insertProvider";
		}
	}

	/**
	 * Xem chi tiết 1 nhà sản xuất
	 */
	@RequestMapping(value = "viewProvider")
	public String viewProvider(@RequestParam("Id") Integer id, Model model) {
		Provider provider = providerDAO.getProviderById(id);
		model.addAttribute("provider", provider);
		return "admin/providerDetail";
	}

	/**
	 * Xử lý trước khi sửa nhà sản xuất
	 */
	@RequestMapping(value = "initUpdateProvider")
	public String initUpdateProvider(Model model, @RequestParam("Id") Integer id) {
		Provider provider = providerDAO.getProviderById(id);
		model.addAttribute("provider", provider);
		return "admin/updateProvider";
	}

	/**
	 * Xử lý Cập Nhật nhà sản xuất
	 */
	@RequestMapping(value = "updateProvider")
	public String updateProvider(Model model, @ModelAttribute(name = "provider") Provider provider) {
		boolean result = false;
		result = providerDAO.updateProvider(provider);
		if (result) {
			return "redirect:/getAllProvider";
		} else {
			model.addAttribute("message", "Cập Nhật nhà sản xuất Không Thành Công.");
			return "admin/updateProvider";
		}
	}

	/**
	 * Xử lý khi ấn nút xóa Nhà sản xuất
	 */
	@RequestMapping(value = "deleteProvider")
	public String deleteProvider(Model model, @RequestParam("Id") Integer id, HttpSession session) {
		if (session.getAttribute("userNameAdmin") != null) {
			Provider provider = providerDAO.getProviderById(id);
			provider.setStatus(false);
			boolean result = providerDAO.updateProvider(provider);
			if (result) {
				return "redirect:getAllProvider";
			} else {
				return "admin/Error";
			}
		} else {
			return "redirect:/initBackendLogin";
		}
	}

	/**
	 * Lấy toàn bộ danh sách của sản phẩm
	 */
	@RequestMapping(value = "getAllProductBackend")
	public String getAllProductBackend(Model model, HttpSession session) {
		if (session.getAttribute("userNameAdmin") != null) {
			List<Product> lstProduct = productDAO.getAllProduct();
			model.addAttribute("lstProduct", lstProduct);
			return "admin/product";
		} else {
			return "redirect:/initBackendLogin";
		}
	}

	/**
	 * Xử lý trước khi thêm sản phẩm
	 */
	@RequestMapping(value = "initInsertProduct")
	public String initInsertProduct(Model model, HttpSession session) {
		if (session.getAttribute("userNameAdmin") != null) {
			List<Provider> allProvider = providerDAO.getAllProvider();
			List<CataLogs> allCataLog = cataLogsDAO.getAllCataLog();
			model.addAttribute("listProvider", allProvider);
			model.addAttribute("listCatalog", allCataLog);
			model.addAttribute("newproduct", new Product());
			return "admin/insertProduct";
		} else {
			return "redirect:/initBackendLogin";
		}
	}

	/**
	 * Xử lý thêm mới sản phẩm
	 */
	@RequestMapping(value = "insertProduct")
	public String insertProduct(Model model, @Valid @ModelAttribute("newproduct") Product newproduct,
			@RequestParam("imagesPrimary") MultipartFile imagesPrimary,
			@RequestParam("imageLink") MultipartFile[] imageLink, HttpServletRequest request, BindingResult result) {
		if (!result.hasErrors()) {
			Date createDate = java.util.Calendar.getInstance().getTime();
			newproduct.setCreated(createDate);
			newproduct.setStatus(true);
			if (imagesPrimary.getOriginalFilename() != "") {
				uploadFile("resources/user/image/buy", imagesPrimary, request);
				newproduct.setImages(imagesPrimary.getOriginalFilename());
			}
			List<String> listImageLink = new ArrayList<>();
			if (imageLink.length == 5) {
				for (MultipartFile itemImageLink : imageLink) {
					if (itemImageLink.getOriginalFilename() != "") {
						uploadFile("resources/user/image/All__ImageProduct", itemImageLink, request);
						listImageLink.add(itemImageLink.getOriginalFilename());
					}
				}
			}
			Boolean check = productDAO.insertProduct(newproduct);
			if (check) {
				ImageLink newImageLink = new ImageLink();
				for (String itemlink : listImageLink) {
					newImageLink.setProduct(newproduct);
					newImageLink.setImageLinkName(itemlink);
					newImageLink.setStatus(true);
					imageLinkDAO.insertImagelink(newImageLink);
				}
				return "redirect:/getAllProductBackend";
			} else {
				return "admin/Error";
			}
		} else {
			return "admin/insertProduct";
		}

	}

	/**
	 * Xem chi tiết 1 sản phẩm
	 */
	@RequestMapping(value = "viewProduct")
	public String viewProduct(Model model, @RequestParam("Id") Integer id, HttpSession session) {
		if (session.getAttribute("userNameAdmin") != null) {
			Product product = productDAO.getProductById(id);
			List<CataLogs> allCataLog = cataLogsDAO.getAllCataLog();
			List<Provider> allProvider = providerDAO.getAllProvider();
			model.addAttribute("listCatalog", allCataLog);
			model.addAttribute("listProvider", allProvider);
			model.addAttribute("productDetail", product);
			return "admin/productDetail";
		} else {
			Users users = new Users();
			model.addAttribute("users", users);
			return "admin/login";
		}
	}

	/**
	 * Xử lý sản phẩm trước khi update
	 */
	@RequestMapping(value = "initUpdateProduct")
	public String initUpdateProduct(Model model, @RequestParam("Id") Integer id, HttpSession session) {
		if (session.getAttribute("userNameAdmin") != null) {
			Product product = productDAO.getProductById(id);
			List<CataLogs> allCataLog = cataLogsDAO.getAllCataLog();
			List<Provider> allProvider = providerDAO.getAllProvider();
			model.addAttribute("listCatalog", allCataLog);
			model.addAttribute("listProvider", allProvider);
			model.addAttribute("productDetail", product);
			return "admin/updateProduct";
		} else {
			Users users = new Users();
			model.addAttribute("users", users);
			return "admin/login";
		}
	}

	/**
	 * Update Sản phẩm
	 * 
	 * @throws ParseException
	 */
	@RequestMapping(value = "updateProduct")
	public String updateProduct(Model model, @ModelAttribute("productDetail") Product productDetail,
			HttpSession session, HttpServletRequest request) throws ParseException {
		String priceInput = request.getParameter("GiaNhap");
		String priceOutput = request.getParameter("GiaBan");
		Locale locale = new Locale("vi", "VN");
		float GiaNhap = Float.parseFloat(parse(priceInput, locale).toString());
		float GiaBan = Float.parseFloat(parse(priceOutput, locale).toString());
		Product product = productDAO.getProductById(productDetail.getProductId());
		product.setProductName(productDetail.getProductName());
		product.setProductContent(productDetail.getProductContent());
		product.setProductContentDetail(productDetail.getProductContentDetail());
		product.setPriceInput(GiaNhap);
		product.setPriceOutput(GiaBan);
		product.setCatalog(productDetail.getCatalog());
		product.setProvider(productDetail.getProvider());
		product.setDiscount(productDetail.getDiscount());
		Boolean check = productDAO.updateProduct(product);
		if (check) {
			return "redirect:/getAllProductBackend";
		} else {
			return "admin/Error";
		}
	}

	/**
	 * Xóa Sản Phẩm
	 */
	@RequestMapping(value = "deleteProduct")
	public String deleteProduct(Model model, @RequestParam("Id") Integer id, HttpSession session) {
		if (session.getAttribute("userNameAdmin") != null) {
			Product product = productDAO.getProductById(id);
			product.setStatus(false);
			Boolean check = productDAO.updateProduct(product);
			if (check) {
				return "redirect:/getAllProductBackend";
			} else {
				return "admin/Error";
			}
		} else {
			Users users = new Users();
			model.addAttribute("users", users);
			return "admin/login";
		}
	}

	/**
	 * Xem Danh Sách Màu Sắc
	 */
	@RequestMapping(value = "getAllColor")
	public String getAllColor(Model model, HttpSession session) {
		if (session.getAttribute("userNameAdmin") != null) {
			List<Color> allColor = colorDAO.getAllColor();
			model.addAttribute("listColor", allColor);
			return "admin/color";
		} else {
			Users users = new Users();
			model.addAttribute("users", users);
			return "admin/login";
		}
	}

	/**
	 * Xử lý trước khi thêm mới màu sắc
	 */
	@RequestMapping(value = "initInsertColor")
	public String initInsertColor(Model model, HttpSession session) {
		if (session.getAttribute("userNameAdmin") != null) {
			Color newColor = new Color();
			model.addAttribute("newColor", newColor);
			return "admin/insertColor";
		} else {
			Users users = new Users();
			model.addAttribute("users", users);
			return "admin/login";
		}
	}

	/**
	 * Thêm mới màu sắc
	 */
	@RequestMapping(value = "insertColor")
	public String insertColor(Model model, @ModelAttribute("newColor") Color color, HttpSession session) {
		if (colorDAO.checkColorName(color.getColorName())) {
			model.addAttribute("message", "Tên màu đã tồn tại. Mời bạn chọn tên khác.");
			return "admin/insertColor";
		} else {
			color.setStatus(true);
			boolean result = false;
			result = colorDAO.insertColor(color);
			if (result) {
				return "redirect:/getAllColor";
			} else {
				model.addAttribute("message", "Thêm mới màu không thành công.");
				return "admin/insertColor";
			}
		}
	}

	/**
	 * Xử lý trước khi chỉnh sửa màu sắc
	 */
	@RequestMapping(value = "initUpdateColor")
	public String initUpdateColor(Model model, HttpSession session, @RequestParam("Id") Integer id) {
		if (session.getAttribute("userNameAdmin") != null) {
			Color colorById = colorDAO.getColorById(id);
			model.addAttribute("color", colorById);
			return "admin/updateColor";
		} else {
			Users users = new Users();
			model.addAttribute("users", users);
			return "admin/login";
		}
	}

	/**
	 * Cập Nhật Màu Sắc
	 */
	@RequestMapping(value = "updateColor")
	public String updateColor(Model model, @ModelAttribute("color") Color color, HttpSession session) {
		boolean result = false;
		result = colorDAO.updateColor(color);
		if (result) {
			return "redirect:/getAllColor";
		} else {
			model.addAttribute("message", "Sửa màu không thành công.");
			return "admin/updateColor";
		}
	}

	/**
	 * Xóa màu sắc
	 */
	@RequestMapping(value = "deleteColor")
	public String deleteColor(Model model, @RequestParam("Id") Integer id) {
		Color colorById = colorDAO.getColorById(id);
		colorById.setStatus(false);
		boolean result = false;
		result = colorDAO.updateColor(colorById);
		if (result) {
			return "redirect:/getAllColor";
		} else {
			model.addAttribute("message", "Sửa màu không thành công.");
			return "admin/Error";
		}
	}

	/**
	 * Danh Sách người dùng
	 */
	@RequestMapping(value = "getAllUser")
	public String getAllUser(Model model, HttpSession session) {
		if (session.getAttribute("userNameAdmin") != null) {
			List<Users> allUser = usersDAO.getAllUser();
			model.addAttribute("listUser", allUser);
			return "admin/user";
		} else {
			Users users = new Users();
			model.addAttribute("users", users);
			return "admin/login";
		}
	}

	/**
	 * Xử lý trước khi thêm mới người dùng
	 */
	@RequestMapping(value = "initInsertUser")
	public String initInsertUser(Model model, HttpSession session) {
		if (session.getAttribute("userNameAdmin") != null) {
			Users users = new Users();
			model.addAttribute("Users", users);
			return "admin/insertUser";
		} else {
			Users users = new Users();
			model.addAttribute("users", users);
			return "admin/login";
		}
	}

	/**
	 * Thêm mới người dùng
	 */
	@RequestMapping(value = "insertUser")
	public String insertUser(Model model, @ModelAttribute("Users") Users user) {
		if (usersDAO.checkUserName(user)) {
			model.addAttribute("message", "Tên đăng nhập đã tồn tại.");
			return "admin/insertUser";
		} else if (usersDAO.checkUserEmail(user)) {
			model.addAttribute("message", "Email đã tồn tại.");
			return "admin/insertUser";
		} else if (usersDAO.checkUserPhone(user)) {
			model.addAttribute("message", "Số điện thoại đã tồn tại.");
			return "admin/insertUser";
		} else {
			Date date = java.util.Calendar.getInstance().getTime();
			user.setStatus(true);
			user.setUserImage("default.png");
			user.setCreated(date);
			boolean insertUsers = usersDAO.insertUsers(user);
			// tạo giỏ hàng cho tài khoản
			Cart cart = new Cart();
			cart.setUser(user);
			cart.setCreated(date);
			cart.setStatus(true);
			Boolean insertCart = cartDAO.InsertCart(cart);
			// tạo quyền mặc định cho tài khoản
			User_Role user_role = new User_Role();
			Role role = new Role();
			role.setRoleId(1);
			user_role.setRole(role);
			user_role.setUser(user);
			user_role.getUser().setUserId(user.getUserId());
			boolean insertRoleForUser = user_roleDAO.insertRoleForUser(user_role);
			if (insertUsers && insertCart && insertRoleForUser) {
				return "redirect:/getAllUser";
			} else {
				model.addAttribute("message", "Đăng kí tài khoản không thành công.");
				return "redirect:/initInsertUser";
			}
		}
	}

	/**
	 * Xử lý trước khi update người dùng
	 */
	@RequestMapping(value = "initUpdateUser")
	public String initUpdateUser(Model model, HttpSession session, @RequestParam("Id") Integer id) {
		if (session.getAttribute("userNameAdmin") != null) {
			Users userById = usersDAO.getUserById(id);
			model.addAttribute("usersDetail", userById);
			return "admin/updateUsers";
		} else {
			Users users = new Users();
			model.addAttribute("users", users);
			return "admin/login";
		}
	}

	/**
	 * update người dùng
	 */
	@RequestMapping(value = "updateUser")
	public String updateUser(Model model, @ModelAttribute("usersDetail") Users user) {
		Users userUpdate = usersDAO.getUserById(user.getUserId());
		if (usersDAO.checkUserName(user) && !user.getUserName().equals(userUpdate.getUserName())) {
			model.addAttribute("message", "Tên đăng nhập đã được dùng để đăng kí.");
			return "admin/updateUsers";
		} else if (usersDAO.checkUserEmail(user) && !user.getEmail().equals(userUpdate.getEmail())) {
			model.addAttribute("message", "Email đã được dùng để đăng kí");
			return "admin/updateUsers";
		} else if (usersDAO.checkUserPhone(user) && !user.getPhone().equals(userUpdate.getPhone())) {
			model.addAttribute("message", "Số điện thoại đã được dùng để đăng kí");
			return "admin/updateUsers";
		} else {
			userUpdate.setFullName(user.getFullName());
			userUpdate.setUserName(user.getUserName());
			userUpdate.setPassWord(user.getPassWord());
			userUpdate.setAddress(user.getAddress());
			userUpdate.setPhone(user.getPhone());
			userUpdate.setEmail(user.getEmail());
			userUpdate.setStatus(user.getStatus());
			boolean check = false;
			check = usersDAO.updateUsers(userUpdate);
			if (check) {
				return "redirect:/getAllUser";
			} else {
				model.addAttribute("message", "Sửa không thánh công.");
				return "redirect:/initUpdateUser";
			}
		}

	}

	/**
	 * Xóa người dùng
	 */
	@RequestMapping(value = "deleteUser")
	public String deleteUser(Model model, @RequestParam("Id") Integer id, HttpSession session) {
		if (session.getAttribute("userNameAdmin") != null) {
			Users user = usersDAO.getUserById(id);
			user.setStatus(false);
			boolean check = false;
			check = usersDAO.updateUsers(user);
			if (check) {
				return "redirect:/getAllUser";
			} else {
				model.addAttribute("message", "xóa người dùng không thành công.");
				return "admin/user";
			}
		} else {
			Users users = new Users();
			model.addAttribute("users", users);
			return "admin/login";
		}
	}

	/**
	 * Hiển thị tất cả các Role
	 */
	@RequestMapping(value = "getAllRole")
	public String getAllRole(Model model, HttpSession session) {
		if (session.getAttribute("userNameAdmin") != null) {
			List<Role> allRole = roleDAO.getAllRole();
			model.addAttribute("listRole", allRole);
			return "admin/role";
		} else {
			Users users = new Users();
			model.addAttribute("users", users);
			return "admin/login";
		}
	}

	/**
	 * Xử lý trước khi thêm mới Role
	 * 
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "initInsertRole")
	public String initInsertRole(Model model, HttpSession session) {
		if (session.getAttribute("userNameAdmin") != null) {
			Role role = new Role();
			model.addAttribute("newRole", role);
			return "admin/insertRole";
		} else {
			Users users = new Users();
			model.addAttribute("users", users);
			return "admin/login";
		}
	}

	/**
	 * Thêm mới Role
	 * 
	 * @param model
	 * @param role
	 * @return
	 */
	@RequestMapping(value = "insertRole")
	public String insertRole(Model model, @ModelAttribute("newRole") Role role) {
		if (roleDAO.checkRoleName(role)) {
			model.addAttribute("message", "Tên chức năng đã tồn tại.");
			return "admin/insertRole";
		} else {
			role.setStatus(true);
			boolean result = roleDAO.insertRole(role);
			if (result) {
				return "redirect:/getAllRole";
			} else {
				model.addAttribute("message", "Thêm mới không thành công.");
				return "admin/insertRole";
			}
		}
	}

	/**
	 * Xử lý trước khi cập nhật Role
	 * 
	 * @param model
	 * @param session
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "initUpdateRole")
	public String initUpdateRole(Model model, HttpSession session, @RequestParam("Id") Integer id) {
		if (session.getAttribute("userNameAdmin") != null) {
			Role roleById = roleDAO.getRoleById(id);
			model.addAttribute("roleUpdate", roleById);
			return "admin/updateRole";
		} else {
			Users users = new Users();
			model.addAttribute("users", users);
			return "admin/login";
		}
	}

	/**
	 * Cập nhật Role
	 * 
	 * @param model
	 * @param role
	 * @return
	 */
	@RequestMapping(value = "updateRole")
	public String updateRole(Model model, @ModelAttribute("roleUpdate") Role role) {
		Role roleById = roleDAO.getRoleById(role.getRoleId());
		if (roleDAO.checkRoleName(role) && !role.getRoleName().equals(roleById.getRoleName())) {
			model.addAttribute("message", "Tên chức năng đã tồn tại.");
			return "admin/updateRole";
		} else {
			boolean result = roleDAO.updateRole(role);
			if (result) {
				return "redirect:/getAllRole";
			} else {
				model.addAttribute("message", "Cập Nhật không thành công.");
				return "admin/updateRole";
			}
		}
	}

	/**
	 * Xóa Role
	 * 
	 * @param model
	 * @param session
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "deleteRole")
	public String deleteRole(Model model, HttpSession session, @RequestParam("Id") Integer id) {
		if (session.getAttribute("userNameAdmin") != null) {
			Role roleById = roleDAO.getRoleById(id);
			roleById.setStatus(false);
			boolean result = roleDAO.updateRole(roleById);
			if (result) {
				return "redirect:/getAllRole";
			} else {
				model.addAttribute("message", "Xóa không thành công.");
				return "admin/Error";
			}
		} else {
			Users users = new Users();
			model.addAttribute("users", users);
			return "admin/login";
		}
	}
	/**
	 * Lấy tất cả các hóa đơn
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "getAllOrder")
	public String getAllOrder(Model model, HttpSession session) {
		if (session.getAttribute("userNameAdmin") != null) {
			List<Orders> allOrders = ordersDAO.getAllOrders();
			model.addAttribute("listOrder", allOrders);
			return "admin/orders";
		} else {
			Users users = new Users();
			model.addAttribute("users", users);
			return "admin/login";
		}		
	}
	/**
	 * Xác thực hóa đơn
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "confirmOrder")
	public String confirmOrder(Model model, @RequestParam("Id") Integer id) {
		Orders orders = ordersDAO.findOrdersById(id);
		orders.setStatus(1);
		boolean result = ordersDAO.updateOrder(orders);
		if (result) {
			return "redirect:/getAllOrder";
		} else {
			model.addAttribute("message", "Xác thực không thành công.");
			return "admin/Error";
		}
	}
	/**
	 * Hàm xử lý upload file
	 * @param folder
	 * @param muiMultipartFile
	 * @param request
	 */
	public void uploadFile(String folder, MultipartFile muiMultipartFile, HttpServletRequest request) {
		String path = request.getServletContext().getRealPath(folder);
		File f = new File(path);
		File dest = new File(f.getAbsolutePath() + "/" + muiMultipartFile.getOriginalFilename());
		if (!dest.exists()) {
			try {
				Files.write(dest.toPath(), muiMultipartFile.getBytes(), StandardOpenOption.CREATE);
			} catch (IOException e1) {
				e1.printStackTrace();
			}
		}
	}

	/**
	 * convert Currency to Float
	 * 
	 * @param amount
	 * @param locale
	 * @return
	 * @throws ParseException
	 */
	public static BigDecimal parse(final String amount, final Locale locale) throws ParseException {
		final NumberFormat format = NumberFormat.getNumberInstance(locale);
		if (format instanceof DecimalFormat) {
			((DecimalFormat) format).setParseBigDecimal(true);
		}
		try {
			return (BigDecimal) format.parse(amount.replaceAll("[^\\d.,]", ""));
		} catch (java.text.ParseException e) {
			e.printStackTrace();
		}
		return null;
	}

}
