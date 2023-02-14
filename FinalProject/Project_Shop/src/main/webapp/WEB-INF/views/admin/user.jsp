
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
		$('#user').dataTable({
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
		<script src="/SpringFrameworks/jsp/Fontend/js/test.js"
			type="text/javascript"></script>

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
							<div class="table-header">Danh sách người dùng</div>
							<div>
								<table id="user" class="table table-striped table-bordered"
									cellspacing="0" width="100%">
									<thead>
										<tr>
											<th>Mã người dung</th>
											<th>Tên đăng nhập</th>
											<th>Mật khẩu</th>
											<th>Số Điện Thoại</th>
											<th>Email</th>
											<th>Địa Chỉ</th>
											<th class="hidden-480">Trạng thái</th>
											<th></th>
										</tr>
									</thead>

									<tbody>
										<c:forEach items="${listUser}" var="user">
											<tr>
												<td>${user.userId}</td>
												<td>${user.userName}</td>
												<td>${user.passWord}</td>
												<td>${user.phone}</td>
												<td>${user.email}</td>
												<td>${user.address}</td>
												<c:if test="${user.status == 'True'}">
													<td>Kích hoạt</td>
												</c:if>
												<c:if test="${user.status == 'False'}">
													<td>Không kích hoạt</td>
												</c:if>
												<td>
													<div class="hidden-sm hidden-xs action-buttons">
														<a class="blue" href="#"> <i
															class="ace-icon fa fa-search-plus bigger-130"></i>
														</a> <a class="green"
															href="initUpdateUser?Id=${user.userId}"> <i
															class="ace-icon fa fa-pencil bigger-130"></i>
														</a> <a class="red" href="deleteUser?Id=${user.userId}" onclick="confirm('bạn có muốn xóa người dùng này không?');">
															<i class="ace-icon fa fa-trash-o bigger-130"></i>
														</a>
													</div>
												</td>
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
