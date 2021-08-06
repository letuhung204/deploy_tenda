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
                            <h3 class="box-title">Nhà Cung Cấp : ${tenNhaCungCap}</h3>
                        </div>
                        <div class="box-header">
                            <spring:url value="/them-nguyen-lieu/${maNhaCungCap}" var="addURL" />
                            <a class="btn btn-primary" href="${addURL}" role="button"><i
                                    class="glyphicon glyphicon-plus"></i> Thêm Nguyên Liệu</a>

                            <spring:url value="/gioHang?maNhaCungCap=${maNhaCungCap}" var="diToiGio" />
                            <a class="btn btn-primary" href="${diToiGio}" role="button"></i> Tới Giỏ Hàng Của Bạn</a>
                        </div>
                        <div class="box-header">
                            <form:form method="GET" modelAttribute="test"
                                       action="/nguyenlieu/${maNhaCungCap}?tenNguyenLieu=${tenNguyenLieu}" cssClass="well form-horizontal">

                            <div class="input-group">
                                <form:input path="tenNguyenLieu" id="tenNguyenLieu"
                                            placeholder="nhập tên nguyên liệu" class="form-control"
                                            type="text" ></form:input>

                                <button class="btn btn-primary" type="submit" role="button" style="margin-top: 10px;"><i
                                        class="glyphicon glyphicon-search"></i> Tìm Kiếm</button>
                            </div>

                        </div>

                        <!-- /.box-header -->
                        <div class="box-body">
                            <table id="example1" class="table table-bordered table-striped">
                                <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Tên Nguyên Liệu</th>
                                    <th>Mã nguyên liệu</th>
                                    <th>Loại Nguyên Liệu</th>
                                    <th>Đơn giá</th>
                                    <th>Đơn vị tính</th>
                                    <th>Action</th>
                                    <th>Thêm Vào Giỏ Hàng</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:if test="${not empty ThemGioHangThanhCong}">
                                    <div class="callout callout-warning lead">
                                        <h4>${ThemGioHangThanhCong}</h4>
                                        <h4 style="color: #8b1414">Note: Load lại trang để ẩn thông báo !</h4>
                                    </div>
                                </c:if>
                                <c:forEach items="${nguyenLieuList}" var="nguyenLieu" varStatus="s">
                                    <tr>
                                        <td><c:out value="${s.index + 1}" /></td>
                                        <td><c:out value="${nguyenLieu.tenNguyenLieu}" /></td>
                                        <td><c:out value="${nguyenLieu.maNguyenLieu}" /></td>
                                        <td><c:out value="${nguyenLieu.loaiNguyenLieu}" /></td>
                                        <td><c:out value="${nguyenLieu.donGia}" /></td>
                                        <td><c:out value="${nguyenLieu.donViTinh}" /></td>
                                        <td>
                                            <div style="margin-left: 5px;width: 40%;float: left;">
                                                <spring:url
                                                        value="/them-nguyen-lieu/${maNhaCungCap}?id=${nguyenLieu.id}" var="editURL" />
                                                <a href="${editURL}" style="font-size: 25px;"><i
                                                        class="glyphicon glyphicon-pencil"></i></a>
                                            </div>
                                            <div style="width: 40%;float: left">
                                                <spring:url value="/delete-nguyen-lieu/${maNhaCungCap}?id=${nguyenLieu.id}" var="deleteURL" /> <a href="${deleteURL}" style="font-size: 25px;"
                                                                                                                                                  onclick="return confirm('Bạn chắc chắn xoá nguyên liệu có tên : ${nguyenLieu.tenNguyenLieu} ?');"><i
                                                    class="glyphicon glyphicon-trash"></i> </a>
                                            </div>
                                        </td>
                                        <td>
                                                <label class="control-label col-sm-2 requiredField">
                                                    Số Lượng <span class="asteriskField"> *</span>
                                                </label>

                                                <form:input path="soLuong" id="soLuong${s.index}" cssStyle="width: 50%"
                                                            class="form-control"
                                                             type="number" />

                                                <button class="btn btn-primary" style="margin-top: 10px" onclick="callApi${s.index}()">Thêm Vào Giỏ</button>

<%--                                            </form:form>--%>
                                        </td>
                                    </tr>
                                    <script>
                                        function callApi${s.index}() {
                                            var soLuong = document.getElementById("soLuong${s.index}").value;
                                            console.log("test");
                                            console.log(soLuong);
                                            if(soLuong != null){
                                                var finalUrl = "/save-draf-don-hang/${maNhaCungCap}/${nguyenLieu.id}"+"?soLuong="+soLuong;
                                                $.ajax({
                                                    url: finalUrl,
                                                    cache: false,
                                                    success: function (html) {
                                                        // Parse the recieved data here.
                                                        console.log(html);
                                                        alert("thêm vào giỏ hàng thành công")
                                                    }
                                                });
                                            }
                                        }
                                    </script>
                                </c:forEach>

                                </tbody>
                            </table>

                        </div>
                        <!-- /.box-body -->
                        </form:form>
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