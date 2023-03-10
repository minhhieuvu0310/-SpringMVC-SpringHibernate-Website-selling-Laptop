<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div id="sidebar" class="sidebar responsive">
    <script type="text/javascript">
        try {
            ace.settings.check('sidebar', 'fixed')
        } catch (e) {
        }
    </script>

    <div class="sidebar-shortcuts" id="sidebar-shortcuts">
                <div class="sidebar-shortcuts-large" id="sidebar-shortcuts-large">
                    <button class="btn btn-success">
                        <i class="ace-icon fa fa-signal"></i>
                    </button>

                    <button class="btn btn-info">
                        <i class="ace-icon fa fa-pencil"></i>
                    </button>

                    <button class="btn btn-warning">
                        <i class="ace-icon fa fa-users"></i>
                    </button>

                    <button class="btn btn-danger">
                        <i class="ace-icon fa fa-cogs"></i>
                    </button>
                </div>

                <div class="sidebar-shortcuts-mini" id="sidebar-shortcuts-mini">
                    <span class="btn btn-success"></span>

                    <span class="btn btn-info"></span>

                    <span class="btn btn-warning"></span>

                    <span class="btn btn-danger"></span>
                </div>
    </div><!-- /.sidebar-shortcuts -->

            <ul class="nav nav-list">
                <li class="active">
                    <a href="<%=request.getContextPath()%>/homeBackend">
                        <i class="menu-icon fa fa-home"></i>
                        <span class="menu-text"> Trang chủ </span>
                    </a>

                    <b class="arrow"></b>
                </li>

                <li class="">
                    <a href="#" class="dropdown-toggle">
                        <i class="menu-icon fa fa-list"></i>
                        <span class="menu-text"> Quản lí danh mục </span>

                        <b class="arrow fa fa-angle-down"></b>
                    </a>

                    <b class="arrow"></b>

                    <ul class="submenu">
                        <li class="">
                            <a href="<%=request.getContextPath()%>/getAllCatalog">
                                <i class="menu-icon fa fa-caret-right"></i>
                                Danh sách danh mục
                            </a>

                            <b class="arrow"></b>
                        </li>

                        <li class="">
                            <a href="<%=request.getContextPath()%>/initInsertCatalog">
                                <i class="menu-icon fa fa-caret-right"></i>
                                Thêm mới
                            </a>

                            <b class="arrow"></b>
                        </li>
                    </ul>
                </li>

                <li class="">
                    <a href="#" class="dropdown-toggle">
                        <i class="menu-icon fa fa-list"></i>
                        <span class="menu-text"> Nhà Sản Xuất </span>

                        <b class="arrow fa fa-angle-down"></b>
                    </a>

                    <b class="arrow"></b>

                    <ul class="submenu">
                        <li class="">
                            <a href="<%=request.getContextPath()%>/getAllProvider">
                                <i class="menu-icon fa fa-caret-right"></i>
                                Danh Sách Nhà Sản Xuất
                            </a>

                            <b class="arrow"></b>
                        </li>

                        <li class="">
                            <a href="<%=request.getContextPath()%>/initInsertProvider">
                                <i class="menu-icon fa fa-caret-right"></i>
                                Thêm mới
                            </a>
                            <b class="arrow"></b>
                        </li>
                    </ul>
                </li>


                <li class="">
                    <a href="#" class="dropdown-toggle">
                        <i class="menu-icon fa fa-table"></i>
                        <span class="menu-text"> Quản lí sản phẩm </span>

                        <b class="arrow fa fa-angle-down"></b>
                    </a>

                    <b class="arrow"></b>

                    <ul class="submenu">
                        <li class="">
                            <a href="#" class="dropdown-toggle">

                                <span class="menu-text"> Sản phẩm</span>

                                <b class="arrow fa fa-angle-down"></b>
                            </a>

                            <b class="arrow"></b>
                            <ul class="submenu">
                                <li class="">
                                    <a href="<%=request.getContextPath()%>/getAllProductBackend">
                                        <i class="menu-icon fa fa-caret-right"></i>
                                        Danh sách sản phẩm
                                    </a>

                                    <b class="arrow"></b>
                                </li>

                                <li class="">
                                    <a href="<%=request.getContextPath()%>/initInsertProduct">
                                        <i class="menu-icon fa fa-caret-right"></i>
                                        Thêm mới sản phẩm
                                    </a>

                                    <b class="arrow"></b>
                                </li>
                            </ul>
                        </li>

                        <li class="">
                            <a href="#" class="dropdown-toggle">

                                <span class="menu-text"> Màu sắc </span>

                                <b class="arrow fa fa-angle-down"></b>
                            </a>


                            <b class="arrow"></b>

                            <ul class="submenu">
                                <li class="">
                                    <a href="<%=request.getContextPath()%>/getAllColor">
                                        <i class="menu-icon fa fa-caret-right"></i>
                                        Danh sách màu sắc
                                    </a>

                                    <b class="arrow"></b>
                                </li>

                                <li class="">
                                    <a href="<%=request.getContextPath()%>/initInsertColor">
                                        <i class="menu-icon fa fa-caret-right"></i>
                                        Thêm mới
                                    </a>

                                    <b class="arrow"></b>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </li>   




                <li class="">
                    <a href="#" class="dropdown-toggle">
                        <i class="menu-icon fa fa-user"></i>
                        <span class="menu-text"> Quản lí người dùng </span>

                        <b class="arrow fa fa-angle-down"></b>
                    </a>

                    <b class="arrow"></b>

                    <ul class="submenu">
                        <li class="">
                            <a href="" class="dropdown-toggle">

                                <span class="menu-text"> Người dùng </span>

                                <b class="arrow fa fa-angle-down"></b>
                            </a>

                            <b class="arrow"></b>
                            <ul class="submenu">
                                <li class="">
                                    <a href="<%=request.getContextPath()%>/getAllUser">
                                        <i class="menu-icon fa fa-caret-right"></i>
                                        Danh sách người dùng
                                    </a>

                                    <b class="arrow"></b>
                                </li>

                                <li class="">
                                    <a href="<%=request.getContextPath()%>/initInsertUser">
                                        <i class="menu-icon fa fa-caret-right"></i>
                                        Thêm mới người dùng
                                    </a>

                                    <b class="arrow"></b>
                                </li>
                            </ul>
                        </li>

                        <li class="">
                            <a href="#" class="dropdown-toggle">

                                <span class="menu-text"> Nhóm người dùng </span>

                                <b class="arrow fa fa-angle-down"></b>
                            </a>

                            <b class="arrow"></b>
                            <ul class="submenu">
                                <li class="">
                                    <a href="<%=request.getContextPath()%>/getAllRole">
                                        <i class="menu-icon fa fa-caret-right"></i>
                                        Danh sách nhóm
                                    </a>

                                    <b class="arrow"></b>
                                </li>

                                <li class="">
                                    <a href="<%=request.getContextPath()%>/initInsertRole">
                                        <i class="menu-icon fa fa-caret-right"></i>
                                        Thêm mới nhóm
                                    </a>

                                    <b class="arrow"></b>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </li>

                <li class="">
                    <a href="#" class="dropdown-toggle">
                        <i class="menu-icon fa fa-list"></i>
                        <span class="menu-text"> Quản lí đơn hàng </span>

                        <b class="arrow fa fa-angle-down"></b>
                    </a>

                    <b class="arrow"></b>

                    <ul class="submenu">
                        <li class="">
                            <a href="<%=request.getContextPath()%>/getAllOrder">
                                <i class="menu-icon fa fa-caret-right"></i>
                                Danh sách đơn hàng
                            </a>
                            <b class="arrow"></b>
                        </li>
                    </ul>
                </li>

            </ul><!-- /.nav-list -->

    <div class="sidebar-toggle sidebar-collapse" id="sidebar-collapse">
        <i class="ace-icon fa fa-angle-double-left" data-icon1="ace-icon fa fa-angle-double-left" data-icon2="ace-icon fa fa-angle-double-right"></i>
    </div>

    <script type="text/javascript">
        try {
            ace.settings.check('sidebar', 'collapsed')
        } catch (e) {
        }
    </script>
</div>