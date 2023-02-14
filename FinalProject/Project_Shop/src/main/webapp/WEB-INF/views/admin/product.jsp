<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="link_asset.jsp"></jsp:include>
<!-- <link href="/SpringFrameworks/jsp/Fontend/css/styles.css" rel="stylesheet" type="text/css"/> -->
<link href="<c:url value="resources/admin/css/ace.min.css" />"
	rel="stylesheet" type="text/css" />
<script src="<c:url value="resources/admin/js/jquery.min.js" />"
	type="text/javascript"></script>
<script
	src="<c:url value="resources/admin/js/jquery.dataTables.min.js" />"
	type="text/javascript"></script>
<script
	src="<c:url value="resources/admin/js/dataTables.jqueryui.js" />"
	type="text/javascript"></script>
<link href="<c:url value="resources/admin/css/jquery-ui.css" />"
	rel="stylesheet" type="text/css" />
<link
	href="<c:url value="resources/admin/css/dataTables.jqueryui.css" />"
	rel="stylesheet" type="text/css" />
<script src="<c:url value="resources/admin/js/count.js" />"
	type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#product').dataTable({
			"pagingType" : "full_numbers",
			"lengthMenu" : [ [ 5, 10, 20, -1 ], [ 5, 10, 20, "All" ] ],
		});
	});
</script>
<body class="no-skin">
	<jsp:include page="header.jsp"></jsp:include>

	<div class="main-container" id="main-container">
		<script type="text/javascript">
			try {
				ace.settings.check('main-container', 'fixed')
			} catch (e) {
			}
		</script>
		<jsp:include page="menu.jsp"></jsp:include>

		<div class="main-content">
			<div class="main-content-inner">
				<div class="breadcrumbs" id="breadcrumbs">
					<script type="text/javascript">
						try {
							ace.settings.check('breadcrumbs', 'fixed')
						} catch (e) {
						}
					</script>
					<ul class="breadcrumb">
						<li><i class="ace-icon fa fa-home home-icon"></i> <a href="#">Home</a>
						</li>
						<li class="active">Dashboard</li>
					</ul>
					<!-- /.breadcrumb -->
				</div>
				<div class="page-content">
					<div class="row">
						<div class="col-xs-12">
							<div class="table-header">Danh sách sản phẩm</div>
							<div>
								<table id="product" class="table table-striped table-bordered"
									cellspacing="0" width="100%">
									<thead>
										<tr>
											<th>Mã sản phẩm</th>
											<th style="width: 100px; height: 100px; text-align: center;">Ảnh</th>
											<th>Tên sản phẩm</th>
											<th width="70px">Giá nhập</th>
											<th width="70px">Giảm giá</th>
											<th width="70px">Ngày tạo</th>
											<th width="70px">Trạng thái</th>
											<th width="70px"></th>
										</tr>
									</thead>

									<tbody>
										<c:forEach items="${lstProduct}" var="product">
											<tr>
												<td>${product.productId}</td>
												<td><img title="${product.images}"
													src="<c:url value="resources" />/user/image/buy/${product.images}"
													class="img-fix3" style="width: 100px; height: 100px;">
												<td>${product.productContent}</td>
												<td><fmt:formatNumber type="currency" currencySymbol="VND" value="${product.getProductHasDiscount()}"></fmt:formatNumber></td>
												<td><fmt:formatNumber type="percent" maxIntegerDigits="3" value="${product.discount}" /></td>
												<td><fmt:formatDate value="${product.created}" pattern="dd/MM/yyyy" /></td>
												<c:if test="${product.status == 'True'}">
													<td>Kích hoạt</td>
												</c:if>
												<c:if test="${product.status == 'False'}">
													<td>Không kích hoạt</td>
												</c:if>

												<td>
													<div class="hidden-sm hidden-xs action-buttons">
														<a class="blue"
															href="viewProduct?Id=${product.productId}"> <i
															class="ace-icon fa fa-search-plus bigger-130"></i>
														</a> <a class="green"
															href="initUpdateProduct?Id=${product.productId}">
															<i class="ace-icon fa fa-pencil bigger-130"></i>
														</a> <a class="red"
															href="deleteProduct?Id=${product.productId}"> <i
															class="ace-icon fa fa-trash-o bigger-130" onclick="confirm('Bạn muốn xóa sản phẩm này không!');"></i>
														</a>
													</div>
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div><!-- /.row -->
				</div><!-- /.page-content -->
			</div>
		</div>
		<!-- /.main-content -->
		<jsp:include page="footer.jsp"></jsp:include>
	</div>
	<!-- /.main-container -->
</body>
</html>