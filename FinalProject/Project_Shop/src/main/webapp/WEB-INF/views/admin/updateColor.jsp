
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">


    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta charset="utf-8" />
    <jsp:include page="link_asset.jsp"></jsp:include>
	<link rel="stylesheet" href="<c:url value="resources/admin/css/ace.min.css" />" class="ace-main-stylesheet" id="main-ace-style" />
	<link href="<c:url value="resources/admin/css/sweetalert.css" />" rel="stylesheet" type="text/css" />
	<script src="<c:url value="resources/admin/js/sweetalert.min.js" />"
	type="text/javascript"></script>
        <script>
            function validate() {
                var colorName = document.getElementById("colorName").value;
                var na = document.getElementById("natation").value;
                if (colorName != "" && na != "") {
                    return true;
                } else {
                    if (catalogName == "") {
                        swal("Bạn phải nhập tên màu.");
                        document.getElementById("colorName").focus();
                        return false;
                    }
                    if (des == "") {
                        swal("Bạn phải nhập mô tả thể hiện.");
                        document.getElementById("natation").focus();
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
                                <li>
                                    <i class="ace-icon fa fa-home home-icon"></i>
                                    <a href="#">Home</a>
                                </li>
                                <li class="active">Dashboard</li>
                            </ul><!-- /.breadcrumb -->


                        </div>

                        <div class="page-content">

                            <div class="row">
                                <div class="col-xs-12">
                                    <div class="x_panel">
                                        <div class="x_title">
                                            <h4>Quản lí màu sắc <small>  >> Sửa thông tin màu sắc</small></h4>
                                            <div class="clearfix"></div>
                                        <f:form class="form-horizontal form-label-left" action="updateColor" modelAttribute="color" onsubmit="return validate()">
                                             <div class="form-group message">
                                                 ${message}
                                             </div>
                                            <div class="form-group">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">Mã màu <span class="required">*</span>
                                                </label>
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <f:input type="text" id="colorId" class="form-control col-md-7 col-xs-12" path="colorId" readonly="readonly"/>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">Tên màu <span class="required">*</span>
                                                </label>
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <f:input type="text" id="colorName" class="form-control col-md-7 col-xs-12" path="colorName" />
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="last-name">Kí hiệu <span class="required">*</span>
                                                </label>
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <f:input type="text" id="natation"  class="form-control col-md-7 col-xs-12" path="natation" /> 
                                                </div>
                                            </div>                                                
                                                <div class="form-group">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="last-name">Trạng thái <span class="required">*</span>
                                                </label>
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                   <f:select id="status" class="form-control col-md-7 col-xs-12" path="status" >                                                                                                                 
                                                           <f:option value="True" label="Khích hoạt"/>
                                                           <f:option value="False" label="Không kích hoạt"/>                                                       
                                                    </f:select>
                                                </div>
                                            </div>                                                                                                                             
                                            <div class="ln_solid"></div>
                                            <div class="form-group">
                                                <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                                                    <button class="btn btn-primary" type="button" onclick="history.go(-1)">Quay lại</button>
                                                    <button type="submit" class="btn btn-success">Lưu</button>
                                                </div>
                                            </div>

                                        </f:form>
                                    </div>
                                </div>
                            </div>

                        </div><!-- /.row -->
                    </div><!-- /.page-content -->
                </div>
            </div><!-- /.main-content -->

            <jsp:include page="footer.jsp"></jsp:include>

        </div><!-- /.main-container -->

    </body>
</html>

