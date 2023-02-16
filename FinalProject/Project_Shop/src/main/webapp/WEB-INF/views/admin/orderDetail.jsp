<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">


<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta charset="utf-8" />
<jsp:include page="link_asset.jsp"></jsp:include>
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
		$('#order').dataTable({
			"pagingType" : "full_numbers",
			"lengthMenu" : [ [ 5, 10, 20, -1 ], [ 5, 10, 20, "All" ] ],
		});
	});
</script>

<body class="no-skin">


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
							<div class="table-header">Danh sách order</div>

							<div>
								<table id="order" class="table table-striped table-bordered"
									cellspacing="0" width="100%">
									<thead>
										<tr>
											<th style="width: 25%">Mã hóa đơn</th>
											<th style="width: 25%">Sản phẩm</th>
											<th style="width: 25%">Số lượng</th>
											<th style="width: 25%">Tổng tiền</th>
										</tr>

									</thead>
									<tbody>
										<c:forEach var="orderDetail" items="${listOrderDetail}">
											<tr>
												<td>${orderDetail.orders.getOrdersId()}</td>
												<td>${orderDetail.product.getProductName()}</td>
												<td>${orderDetail.quantity}</td>
												<td><fmt:formatNumber type="currency" currencySymbol="VND" value="${orderDetail.amount}"></fmt:formatNumber></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>

							</div>
						</div>

					</div>
					<!-- /.row -->
				</div>
				<!-- /.page-content -->
			</div>
		</div>
		<!-- /.main-content -->

		<jsp:include page="footer.jsp"></jsp:include>

	</div>
	<!-- /.main-container -->
</body>
</html>
