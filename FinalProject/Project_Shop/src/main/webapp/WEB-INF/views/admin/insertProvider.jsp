<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="f" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="link_asset.jsp"></jsp:include>
<link rel="stylesheet"
	href="<c:url value="resources/admin/css/ace.min.css" />"
	class="ace-main-stylesheet" id="main-ace-style" />
<link href="<c:url value="resources/admin/css/sweetalert.css" />"
	rel="stylesheet" type="text/css" />
<script src="<c:url value="resources/admin/js/sweetalert.min.js" />"
	type="text/javascript"></script>
<script>
	function validate() {
		var providerName = document.getElementById("providerName").value;
		var address = document.getElementById("address").value;
		var email = document.getElementById("email").value;
		var phone = document.getElementById("phone").value;
		if (providerName != "" && address != "" && email != "" && phone != "") {
			return true;
		} else {
			if (providerName == "") {
				swal("Bạn phải nhập tên nhà sản xuất.");
				document.getElementById("providerName").focus();
				return false;
			}
			if (address == "") {
				swal("Bạn phải nhập nơi ở của nhà sản xuất.");
				document.getElementById("address").focus();
				return false;
			}
			if (email == "") {
				swal("Bạn phải nhập email nhà sản xuất.");
				document.getElementById("email").focus();
				return false;
			}
			if (phone == "") {
				swal("Bạn phải nhập số điện thoại nhà sản xuất.");
				document.getElementById("phone").focus();
				return false;
			}
		}
	}
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
							href="homeBackend">Trang chủ</a></li>
						<li class="active">Quản lí danh mục</li>
					</ul>
					<!-- /.breadcrumb -->


				</div>

                <div class="page-content">

                    <div class="row">
                        <div class="col-xs-12">
                            <div class="x_panel">
                                <div class="x_title">
                                    <h4>Quản lí danh mục <small> >> Thêm mới</small></h4>
                                    <div class="clearfix"></div>
                                    <f:form class="form-horizontal form-label-left" action="insertProvider" modelAttribute="newprovider"  onsubmit="return validate()">
                                            <div class="form-group message">
                                                ${message}
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">Tên nhà sản xuất <span class="required">*</span>
                                                </label>
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <f:input type="text" id="providerName" class="form-control col-md-7 col-xs-12" path="providerName" />
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="last-name">Nơi ở <span class="required">*</span>
                                                </label>
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <f:input type="text" id="address"  class="form-control col-md-7 col-xs-12" path="address" /> 
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="last-name">Email <span class="required">*</span>
                                                </label>
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <f:input type="text" id="email"  class="form-control col-md-7 col-xs-12" path="email" /> 
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="last-name">Số Điện Thoại <span class="required">*</span>
                                                </label>
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <f:input type="text" id="phone"  class="form-control col-md-7 col-xs-12" path="phone" /> 
                                                </div>
                                            </div>
                                            
                                            <div class="ln_solid"></div>
                                            <div class="form-group">
                                                <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                                                    <button class="btn btn-primary" type="reset">Hủy</button>
                                                    <button class="btn btn-primary" type="button" onclick="history.go(-1)">Quay lại</button>
                                                    <button type="submit" class="btn btn-success">Thêm mới</button>
                                                </div>
                                            </div>
                                        </f:form>
                                </div>
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