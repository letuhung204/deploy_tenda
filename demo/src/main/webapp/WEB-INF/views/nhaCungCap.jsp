<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Module Nguyên Liệu</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta
            content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
            name="viewport">
    <!-- Bootstrap 3.3.6 -->
    <link rel="stylesheet" href="${contextPath}/resources/bootstrap/css/bootstrap.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="../../resources/dist/css/AdminLTE.min.css">
    <!-- AdminLTE Skins. We have chosen the skin-blue for this starter
            page. However, you can choose any other skin. Make sure you
            apply the skin class to the body tag so the changes take effect.
      -->
    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="${contextPath}/resources/css/common.css" rel="stylesheet">
    <link rel="stylesheet" href="${contextPath}/resources/dist/css/skins/skin-blue.min.css">
    <link
            href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
            rel="stylesheet"
            integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN"
            crossorigin="anonymous" />
    <!-- Custom style -->
    <link href="../static/css/style.css"
          rel="stylesheet" />
    <script src="/js/checkValidate.js"></script>
    <style type="text/css">
        .asteriskField {
            color: red;
        }
    </style>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

    <!-- Main Header -->
    <header class="main-header">

        <!-- Logo -->
        <a href="/welcome" class="logo"> <!-- mini logo for sidebar mini 50x50 pixels -->
            <span class="logo-mini"><b>D</b>T</span> <!-- logo for regular state and mobile devices -->
            <span class="logo-lg"><b>Nhập Nguyên Liệu</b> Module</span>
        </a>

        <!-- Header Navbar -->
        <nav class="navbar navbar-static-top" role="navigation">
            <!-- Sidebar toggle button-->
            <a href="#" class="sidebar-toggle" data-toggle="offcanvas"
               role="button"> <span class="sr-only">Toggle navigation</span>
            </a>
            <!-- Navbar Right Menu -->
        </nav>
    </header>
    <!-- Left side column. contains the logo and sidebar -->
    <aside class="main-sidebar">

        <!-- sidebar: style can be found in sidebar.less -->
        <section class="sidebar">

            <!-- Sidebar user panel (optional) -->
            <div class="user-panel">
                <div class="pull-left image">
                    <img src="${contextPath}/resources/dist/img/avatar5.png" class="img-circle" alt="User Image">
                </div>
                <div class="pull-left info">
                    <p>${pageContext.request.userPrincipal.name}</p>
                    <!-- Status -->
                    <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
                </div>
            </div>
            <!-- Sidebar Menu -->
            <ul class="sidebar-menu">
                <li class="active"><a class="" href="/nhacungcap"><i
                        class="glyphicon glyphicon-home"></i> <span>Quản Lý Nhà Cung Cấp</span></a></li>
                <li class="active"><a href="/hoaDon"><i
                        class="glyphicon glyphicon-lock"></i> <span>Hóa Đơn
								</span></a></li>
            </ul>
            <!-- /.sidebar-menu -->
        </section>
        <!-- /.sidebar -->
    </aside>

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>
                Module Nguyên Liệu
            </h1>
        </section>
        <!-- Main content -->
        <section class="content">
            <div class="row">
                <div class="col-xs-12">
                    <div class="box">
                        <div class="box-header">
                            <h3 class="box-title">Data Table Menu</h3>
                        </div>
                        <div class="box-header">
                            <spring:url value="/them-nha-cung-cap" var="addURL" />
                            <a class="btn btn-primary" href="${addURL}" role="button"><i
                                    class="glyphicon glyphicon-plus"></i> Thêm Nhà Cung Cấp</a>
                        </div>

                        <div class="box-header">

                            <form:form method="GET" modelAttribute="test"
                                       action="${getURL}" cssClass="well form-horizontal">
                                <div class="input-group">
                                    <form:input path="tenNhaCungCap" id="tenNhaCungCap"
                                                placeholder="nhập tên nhà cung cấp" class="form-control"
                                                 type="text" ></form:input>
                                    <spring:url value="/nhacungcap?tenNhaCungCap=${tenNhaCungCap}" var="getURL" />
                                    <a class="btn btn-primary" href="${getURL}" role="button"><i
                                            class="glyphicon glyphicon-search"></i> Tìm Kiếm</a>
                                </div>

                            </form:form>

                        </div>
                        <!-- /.box-header -->
                        <div class="box-body">
                            <table id="example1" class="table table-bordered table-striped">
                                <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Tên Nhà Cung Cấp</th>
                                    <th>Địa Chỉ</th>
                                    <th>Số Điện Thoại</th>
                                    <th>Fax</th>
                                    <th>Email</th>
                                    <th>Action</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${nhaCungCapList}" var="nhaCungCap" varStatus="s">
                                    <tr>
                                        <td><c:out value="${s.index + 1}" /></td>
                                        <td><c:out value="${nhaCungCap.tenNhaCungCap}" /></td>
                                        <td><c:out value="${nhaCungCap.email}" /></td>
                                        <td><c:out value="${nhaCungCap.soDienThoai}" /></td>
                                        <td><c:out value="${nhaCungCap.fax}" /></td>
                                        <td><c:out value="${nhaCungCap.diaChi}" /></td>
                                        <td>
                                            <div style="margin-left: 5px;width: 40%;float: left;">
                                                <spring:url
                                                        value="/nguyenlieu?nhaCungCap=${nhaCungCap.id}" var="listURL" />
                                                <a href="${listURL}" style="font-size: 25px;">Danh Sách Nguyên Liệu</a>
                                            </div>
                                            <div style="margin-left: 5px;width: 40%;float: left;">
                                                <spring:url
                                                        value="/them-nha-cung-cap?id=${nhaCungCap.id}" var="editURL" />
                                                <a href="${editURL}" style="font-size: 25px;"><i
                                                        class="glyphicon glyphicon-pencil"></i></a>
                                            </div>
                                            <div style="width: 40%;float: left">
                                                <spring:url value="/delete-nha-cung-cap/${nhaCungCap.id}" var="deleteURL" /> <a href="${deleteURL}" style="font-size: 25px;"
                                                                                                                                onclick="return confirm('Bạn chắc chắn xoá nhà cung cấp có tên : ${nhaCungCap.tenNhaCungCap} ?');"><i
                                                    class="glyphicon glyphicon-trash"></i> </a>
                                            </div>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>

                        </div>
                        <!-- /.box-body -->
                    </div>
                </div>
            </div>
        </section>
        <!-- /.content -->

    </div>
    <!-- /.content-wrapper -->

    <!-- Main Footer -->
    <footer class="main-footer">
        <!-- To the right -->
        <div class="pull-right hidden-xs">Module - Nhập nguyên Liệu </div>
    </footer>

    <!-- Control Sidebar -->
    <aside class="control-sidebar control-sidebar-dark">
        <!-- Create the tabs -->
        <ul class="nav nav-tabs nav-justified control-sidebar-tabs">
            <li class="active"><a href="#control-sidebar-home-tab"
                                  data-toggle="tab"><i class="fa fa-home"></i></a></li>
            <li><a href="#control-sidebar-settings-tab" data-toggle="tab"><i
                    class="fa fa-gears"></i></a></li>
        </ul>
    </aside>
    <!-- /.control-sidebar -->
    <!-- Add the sidebar's background. This div must be placed
   immediately after the control sidebar -->
    <div class="control-sidebar-bg"></div>
</div>
<!-- ./wrapper -->

<!-- REQUIRED JS SCRIPTS -->

<!-- jQuery 2.2.0 -->
<script src="${contextPath}/resources/plugins/jQuery/jQuery-2.2.0.min.js"></script>
<!-- Bootstrap 3.3.6 -->
<script src="${contextPath}/resources/bootstrap/js/bootstrap.min.js"></script>
<!-- AdminLTE App -->
<script src="${contextPath}/resources/dist/js/app.min.js"></script>

<!-- Optionally, you can add Slimscroll and FastClick plugins.
 Both of these plugins are recommended to enhance the
 user experience. Slimscroll is required when using the
 fixed layout. -->
</body>
</html>