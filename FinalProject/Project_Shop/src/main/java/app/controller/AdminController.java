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
import javax.websocket.server.PathParam;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.nimbusds.oauth2.sdk.ParseException;

import app.dao.CartDAO;
import app.dao.CataLogsDAO;
import app.dao.ColorDAO;
import app.dao.ImageLinkDAO;
import app.dao.OrderdetailDAO;
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
import app.entities.Orderdetail;
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
	
	@Autowired
	private OrderdetailDAO orderdetailDAO;

	/**
	 * X??? L?? ????ng Nh???p V??o Trang Admin
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
	 * Ti???n H??nh ????ng Nh???p
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
				session.setAttribute("userAdminId", user.getUserId());
				return "redirect:/homeBackend";
			} else {
				model.addAttribute("message", "Xin l???i t??i kho???n c???a b???n kh??ng ???????c ph??p truy c???p.");
				return "admin/login";
			}
		} else {
			model.addAttribute("message", "Sai th??ng tin ????ng nh???p.");
			return "admin/login";
		}
	}

	/**
	 * Trang ch??? ????ng Nh???p
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
	 * L???y To??n b??? Danh S??ch Danh M???c
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
	 * X??? l?? tr?????c khi th??m m???i m???t danh m???c
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
	 * Th??m m???t danh m???c m???i v??o database
	 */
	@RequestMapping(value = "insertCatalog")
	public String insertCatalog(Model model, @ModelAttribute("newcatalogs") CataLogs newcatalogs) {
		if (cataLogsDAO.checkCatalogNameExsit(newcatalogs.getCatalogName())) {
			model.addAttribute("message", "T??n danh m???c ???? t???n t???i");
			return "admin/insertCatalog";
		} else {
			newcatalogs.setStatus(true);
			boolean check = cataLogsDAO.insertCatalog(newcatalogs);
			if (check) {
				return "redirect:/getAllCatalog";
			} else {
				model.addAttribute("message", "Th??m m???i kh??ng th??nh c??ng");
				return "admin/insertCatalog";
			}
		}
	}

	/**
	 * Xem chi ti???t 1 danh m???c
	 */
	@RequestMapping(value = "viewCatalog")
	public String viewCatalog(@RequestParam("Id") Integer id, Model model) {
		CataLogs catalog = cataLogsDAO.getCatalogsById(id);
		model.addAttribute("catalog", catalog);
		return "admin/catalogDetail";
	}

	/**
	 * X??? l?? tr?????c khi s???a danh m???c
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
	 * X??? l?? C???p Nh???t Danh M???c
	 */
	@RequestMapping(value = "updateCatalog")
	public String updateCatalog(Model model, @ModelAttribute(name = "catalogs") CataLogs catalogs) {
		CataLogs catalogsById = cataLogsDAO.getCatalogsById(catalogs.getCatalogId());
		if (cataLogsDAO.checkCatalogNameExsit(catalogs.getCatalogName()) && !catalogsById.getCatalogName().equals(catalogs.getCatalogName())) {
			model.addAttribute("message", "T??n danh m???c ???? t???n t???i");
			List<CataLogs> allCataLog = cataLogsDAO.getAllCataLog();
			model.addAttribute("listCatalog", allCataLog);
			return "admin/updateCatalog";
		} else{
			boolean result = false;
			result = cataLogsDAO.UpdateCatalog(catalogs);
			if (result) {
				return "redirect:/getAllCatalog";
			} else {
				List<CataLogs> allCataLog = cataLogsDAO.getAllCataLog();
				model.addAttribute("listCatalog", allCataLog);
				model.addAttribute("message", "C???p Nh???t Danh M???c Kh??ng Th??nh C??ng.");
				return "admin/updateCatalog";
			}
		}
	}

	/**
	 * X??? l?? khi ???n n??t x??a Danh M???c
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
	 * L???y To??n b??? Danh S??ch Nh?? S???n Xu???t
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
	 * X??? l?? tr?????c khi th??m m???i m???t nh?? s???n xu???t
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
	 * Th??m m???t nh?? s???n xu???t m???i v??o database
	 */
	@RequestMapping(value = "insertProvider")
	public String insertProvider(Model model, @ModelAttribute("newprovider") Provider newprovider) {
		if (providerDAO.checkProviderNameExsit(newprovider.getProviderName())) {
			model.addAttribute("message", "T??n nh?? s???n xu???t ???? t???n t???i");
			return "admin/insertProvider";
		} else {
			newprovider.setStatus(true);
			boolean result = providerDAO.insertProvider(newprovider);
			if (result) {
				return "redirect:/getAllProvider";
			} else {
				model.addAttribute("message", "Th??m m???i kh??ng th??nh c??ng");
				return "admin/insertProvider";
			}
		}
		
	}

	/**
	 * Xem chi ti???t 1 nh?? s???n xu???t
	 */
	@RequestMapping(value = "viewProvider")
	public String viewProvider(@RequestParam("Id") Integer id, Model model) {
		Provider provider = providerDAO.getProviderById(id);
		model.addAttribute("provider", provider);
		return "admin/providerDetail";
	}

	/**
	 * X??? l?? tr?????c khi s???a nh?? s???n xu???t
	 */
	@RequestMapping(value = "initUpdateProvider")
	public String initUpdateProvider(Model model, @RequestParam("Id") Integer id) {
		Provider provider = providerDAO.getProviderById(id);
		model.addAttribute("provider", provider);
		return "admin/updateProvider";
	}

	/**
	 * X??? l?? C???p Nh???t nh?? s???n xu???t
	 */
	@RequestMapping(value = "updateProvider")
	public String updateProvider(Model model, @ModelAttribute(name = "provider") Provider provider) {
		Provider providerById = providerDAO.getProviderById(provider.getProviderId());;
		if (providerDAO.checkProviderNameExsit(provider.getProviderName()) && !providerById.getProviderName().equals(provider.getProviderName())) {
			model.addAttribute("message", "T??n nh?? s???n xu???t ???? t???n t???i");
			return "admin/updateProvider";
		} else{
			boolean result = false;
			result = providerDAO.updateProvider(provider);
			if (result) {
				return "redirect:/getAllProvider";
			} else {
				model.addAttribute("message", "C???p Nh???t nh?? s???n xu???t Kh??ng Th??nh C??ng.");
				return "admin/updateProvider";
			}
		}
		
		
	}

	/**
	 * X??? l?? khi ???n n??t x??a Nh?? s???n xu???t
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
	 * L???y to??n b??? danh s??ch c???a s???n ph???m
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
	 * X??? l?? tr?????c khi th??m s???n ph???m
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
	 * X??? l?? th??m m???i s???n ph???m
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
	 * Xem chi ti???t 1 s???n ph???m
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
	 * X??? l?? s???n ph???m tr?????c khi update
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
	 * Update S???n ph???m
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
	 * X??a S???n Ph???m
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
	 * Xem Danh S??ch M??u S???c
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
	 * X??? l?? tr?????c khi th??m m???i m??u s???c
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
	 * Th??m m???i m??u s???c
	 */
	@RequestMapping(value = "insertColor")
	public String insertColor(Model model, @ModelAttribute("newColor") Color color, HttpSession session) {
		if (colorDAO.checkColorName(color.getColorName())) {
			model.addAttribute("message", "T??n m??u ???? t???n t???i. M???i b???n ch???n t??n kh??c.");
			return "admin/insertColor";
		} else {
			color.setStatus(true);
			boolean result = false;
			result = colorDAO.insertColor(color);
			if (result) {
				return "redirect:/getAllColor";
			} else {
				model.addAttribute("message", "Th??m m???i m??u kh??ng th??nh c??ng.");
				return "admin/insertColor";
			}
		}
	}

	/**
	 * X??? l?? tr?????c khi ch???nh s???a m??u s???c
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
	 * C???p Nh???t M??u S???c
	 */
	@RequestMapping(value = "updateColor")
	public String updateColor(Model model, @ModelAttribute("color") Color color, HttpSession session) {
		boolean result = false;
		result = colorDAO.updateColor(color);
		if (result) {
			return "redirect:/getAllColor";
		} else {
			model.addAttribute("message", "S???a m??u kh??ng th??nh c??ng.");
			return "admin/updateColor";
		}
	}

	/**
	 * X??a m??u s???c
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
			model.addAttribute("message", "S???a m??u kh??ng th??nh c??ng.");
			return "admin/Error";
		}
	}

	/**
	 * Danh S??ch ng?????i d??ng
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
	 * X??? l?? tr?????c khi th??m m???i ng?????i d??ng
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
	 * Th??m m???i ng?????i d??ng
	 */
	@RequestMapping(value = "insertUser")
	public String insertUser(Model model, @ModelAttribute("Users") Users user) {
		if (usersDAO.checkUserName(user)) {
			model.addAttribute("message", "T??n ????ng nh???p ???? t???n t???i.");
			return "admin/insertUser";
		} else if (usersDAO.checkUserEmail(user)) {
			model.addAttribute("message", "Email ???? t???n t???i.");
			return "admin/insertUser";
		} else if (usersDAO.checkUserPhone(user)) {
			model.addAttribute("message", "S??? ??i???n tho???i ???? t???n t???i.");
			return "admin/insertUser";
		} else {
			Date date = java.util.Calendar.getInstance().getTime();
			user.setStatus(true);
			user.setUserImage("default.png");
			user.setCreated(date);
			boolean insertUsers = usersDAO.insertUsers(user);
			// t???o gi??? h??ng cho t??i kho???n
			Cart cart = new Cart();
			cart.setUser(user);
			cart.setCreated(date);
			cart.setStatus(true);
			Boolean insertCart = cartDAO.InsertCart(cart);
			// t???o quy???n m???c ?????nh cho t??i kho???n
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
				model.addAttribute("message", "????ng k?? t??i kho???n kh??ng th??nh c??ng.");
				return "redirect:/initInsertUser";
			}
		}
	}

	/**
	 * X??? l?? tr?????c khi update ng?????i d??ng
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
	 * update ng?????i d??ng
	 */
	@RequestMapping(value = "updateUser")
	public String updateUser(Model model, @ModelAttribute("usersDetail") Users user) {
		Users userUpdate = usersDAO.getUserById(user.getUserId());
		if (usersDAO.checkUserName(user) && !user.getUserName().equals(userUpdate.getUserName())) {
			model.addAttribute("message", "T??n ????ng nh???p ???? ???????c d??ng ????? ????ng k??.");
			return "admin/updateUsers";
		} else if (usersDAO.checkUserEmail(user) && !user.getEmail().equals(userUpdate.getEmail())) {
			model.addAttribute("message", "Email ???? ???????c d??ng ????? ????ng k??");
			return "admin/updateUsers";
		} else if (usersDAO.checkUserPhone(user) && !user.getPhone().equals(userUpdate.getPhone())) {
			model.addAttribute("message", "S??? ??i???n tho???i ???? ???????c d??ng ????? ????ng k??");
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
				model.addAttribute("message", "S???a kh??ng th??nh c??ng.");
				return "redirect:/initUpdateUser";
			}
		}

	}

	/**
	 * X??a ng?????i d??ng
	 */
	@RequestMapping(value = "deleteUser")
	public String deleteUser(Model model, @RequestParam("Id") Integer id, HttpSession session) {
		if (session.getAttribute("userNameAdmin") != null) {
			int Id = (Integer) session.getAttribute("userAdminId");
			Users user = usersDAO.getUserById(id);
			if(user.getUserId() == Id) {
				model.addAttribute("message", "b???n kh??ng th??? x??a t??i kho???n c???a ch??nh m??nh.");
				return "admin/Error";
			}else {
				user.setStatus(false);
				boolean check = false;
				check = usersDAO.updateUsers(user);
				if (check) {
					return "redirect:/getAllUser";
				} else {
					model.addAttribute("message", "x??a ng?????i d??ng kh??ng th??nh c??ng.");
					return "admin/Error";
				}
			}			
		} else {
			Users users = new Users();
			model.addAttribute("users", users);
			return "admin/login";
		}
	}

	/**
	 * Hi???n th??? t???t c??? c??c Role
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
	 * X??? l?? tr?????c khi th??m m???i Role
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
	 * Th??m m???i Role
	 * 
	 * @param model
	 * @param role
	 * @return
	 */
	@RequestMapping(value = "insertRole")
	public String insertRole(Model model, @ModelAttribute("newRole") Role role) {
		if (roleDAO.checkRoleName(role)) {
			model.addAttribute("message", "T??n ch???c n??ng ???? t???n t???i.");
			return "admin/insertRole";
		} else {
			role.setStatus(true);
			boolean result = roleDAO.insertRole(role);
			if (result) {
				return "redirect:/getAllRole";
			} else {
				model.addAttribute("message", "Th??m m???i kh??ng th??nh c??ng.");
				return "admin/insertRole";
			}
		}
	}

	/**
	 * X??? l?? tr?????c khi c???p nh???t Role
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
	 * C???p nh???t Role
	 * 
	 * @param model
	 * @param role
	 * @return
	 */
	@RequestMapping(value = "updateRole")
	public String updateRole(Model model, @ModelAttribute("roleUpdate") Role role) {
		Role roleById = roleDAO.getRoleById(role.getRoleId());
		if (roleDAO.checkRoleName(role) && !role.getRoleName().equals(roleById.getRoleName())) {
			model.addAttribute("message", "T??n ch???c n??ng ???? t???n t???i.");
			return "admin/updateRole";
		} else {
			boolean result = roleDAO.updateRole(role);
			if (result) {
				return "redirect:/getAllRole";
			} else {
				model.addAttribute("message", "C???p Nh???t kh??ng th??nh c??ng.");
				return "admin/updateRole";
			}
		}
	}

	/**
	 * X??a Role
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
				model.addAttribute("message", "X??a kh??ng th??nh c??ng.");
				return "admin/Error";
			}
		} else {
			Users users = new Users();
			model.addAttribute("users", users);
			return "admin/login";
		}
	}
	/**
	 * L???y t???t c??? c??c h??a ????n
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
	 * X??c th???c h??a ????n
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
			model.addAttribute("message", "X??c th???c kh??ng th??nh c??ng.");
			return "admin/Error";
		}
	}
	
	@RequestMapping(value = "orderDetail")
	public String orderDetail (Model model, HttpSession session, @PathParam("Id") Integer Id) {
		if (session.getAttribute("userNameAdmin") != null) {
			System.out.println("Id hoa don" + Id);
			List<Orderdetail> listOrderDetail = orderdetailDAO.findOrderDetailByOrdersId(Id);
			model.addAttribute("listOrderDetail", listOrderDetail);
			return "admin/orderDetail";
		} else {
			Users users = new Users();
			model.addAttribute("users", users);
			return "admin/login";
		}		
	}
	/**
	 * H??m x??? l?? upload file
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
