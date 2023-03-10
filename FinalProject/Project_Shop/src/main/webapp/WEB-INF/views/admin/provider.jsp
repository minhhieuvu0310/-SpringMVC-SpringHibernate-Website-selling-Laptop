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
		$('#catalog').dataTable({
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
						<li><i class="ace-icon fa fa-home home-icon"></i> <a
							href="homeBackend">Trang ch???</a></li>
						<li class="active">Qu???n l?? Nh?? S???n Xu???t</li>
					</ul>
					<!-- /.breadcrumb -->


				</div>

				<div class="page-content">

					<div class="row">
						<div class="col-xs-12">
							<div class="table-header">
								Danh s??ch nh?? s???n xu???t <br /> <a
									href="<%=request.getContextPath()%>/initInsertProvider" class="">Th??m
									m???i</a>
							</div>

							<div>
								<table id="catalog" class="table table-striped table-bordered"
									cellspacing="0" width="100%">
									<thead>
										<tr>
											<th>M?? nh?? s???n xu???t</th>
											<th>T??n nh?? s???n xu???t</th>
											<th>N??i ???</th>
											<th>Email</th>
											<th>S??? ??i???n tho???i</th>
											<th>Tr???ng Th??i</th>
											<th></th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${listProvider}" var="items">
											<tr>
												<td>${items.providerId }</td>
												<td>${items.providerName }</td>
												<td class="hidden-480">${items.address }</td>
												<td>${items.email }</td>
												<td>${items.phone }</td>
												<c:if test="${items.status == 'True'}">
													<td>C??n h???p t??c</td>
												</c:if>
												<c:if test="${items.status == 'False'}">
													<td>Kh??ng c??n h???p t??c</td>
												</c:if>
												<td>
													<div class="hidden-sm hidden-xs action-buttons">
														<a class="blue" href="viewProvider?Id=${items.providerId }"> <i
															class="ace-icon fa fa-search-plus bigger-130"></i>
														</a> <a class="green" href="initUpdateProvider?Id=${items.providerId }"> <i
															class="ace-icon fa fa-pencil bigger-130"></i>
														</a> <a class="red" href="deleteProvider?Id=${items.providerId }" onclick="return confirm('b???n c?? ch???c mu???n x??a kh??ng?')"> <i
															class="ace-icon fa fa-trash-o bigger-130"></i>
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