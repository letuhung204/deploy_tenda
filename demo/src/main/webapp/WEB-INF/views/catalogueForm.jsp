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
    <title>THE HABOUR COCKTAIL-LOUNGE</title>
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
    <link rel="stylesheet" href="${contextPath}/resources/dist/css/AdminLTE.min.css">
    <!-- AdminLTE Skins. We have chosen the skin-blue for this starter
            page. However, you can choose any other skin. Make sure you
            apply the skin class to the body tag so the changes take effect.
      -->
    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="${contextPath}/resources/css/common.css" rel="stylesheet">
    <link rel="stylesheet" href="${contextPath}/resources/dist/css/skins/skin-blue.min.css">
    <link href="${contextPath}/static/images/logo.png" href="@{/images/logo.png}"
          rel="shortcut icon" />
    <link
            href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
            rel="stylesheet"
            integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN"
            crossorigin="anonymous" />
    <!-- Custom style -->
    <link href="${contextPath}/static/css/style.css" href="@{/css/style.css}"
          rel="stylesheet" />
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
            <span class="logo-lg"><b>Dante</b> Restaurant</span>
        </a>

        <!-- Header Navbar -->
        <nav class="navbar navbar-static-top" role="navigation">
            <!-- Sidebar toggle button-->
            <a href="#" class="sidebar-toggle" data-toggle="offcanvas"
               role="button"> <span class="sr-only">Toggle navigation</span>
            </a>
            <!-- Navbar Right Menu -->
            <div class="navbar-custom-menu">
                <ul class="nav navbar-nav">
                    <!-- Messages: style can be found in dropdown.less-->
                    <li class="dropdown messages-menu">
                        <!-- Menu toggle button --> <a href="#" class="dropdown-toggle"
                                                       data-toggle="dropdown"> <i class="fa fa-envelope-o"></i> <span
                            class="label label-success">4</span>
                    </a>
                        <ul class="dropdown-menu">
                            <li class="header">You have 4 messages</li>
                            <li>
                                <!-- inner menu: contains the messages -->
                                <ul class="menu">
                                    <li>
                                        <!-- start message --> <a href="#">
                                        <div class="pull-left">
                                            <!-- User Image -->
                                            <img src="${contextPath}/resources/dist/img/avatar5.png" class="img-circle"
                                                 alt="User Image">
                                        </div> <!-- Message title and timestamp -->
                                        <h4>
                                            Support Team <small><i class="fa fa-clock-o"></i> 5
                                            mins</small>
                                        </h4> <!-- The message -->
                                        <p>Why not buy a new awesome theme?</p>
                                    </a>
                                    </li>
                                    <!-- end message -->
                                </ul> <!-- /.menu -->
                            </li>
                            <li class="footer"><a href="#">See All Messages</a></li>
                        </ul>
                    </li>
                    <!-- /.messages-menu -->

                    <!-- Notifications Menu -->
                    <li class="dropdown notifications-menu">
                        <!-- Menu toggle button --> <a href="#" class="dropdown-toggle"
                                                       data-toggle="dropdown"> <i class="fa fa-bell-o"></i> <span
                            class="label label-warning">10</span>
                    </a>
                        <ul class="dropdown-menu">
                            <li class="header">You have 10 notifications</li>
                            <li>
                                <!-- Inner Menu: contains the notifications -->
                                <ul class="menu">
                                    <li>
                                        <!-- start notification --> <a href="#"> <i
                                            class="fa fa-users text-aqua"></i> 5 new members joined
                                        today
                                    </a>
                                    </li>
                                    <!-- end notification -->
                                </ul>
                            </li>
                            <li class="footer"><a href="#">View all</a></li>
                        </ul>
                    </li>
                    <!-- Tasks Menu -->
                    <li class="dropdown tasks-menu">
                        <!-- Menu Toggle Button --> <a href="#" class="dropdown-toggle"
                                                       data-toggle="dropdown"> <i class="fa fa-flag-o"></i> <span
                            class="label label-danger">9</span>
                    </a>
                        <ul class="dropdown-menu">
                            <li class="header">You have 9 tasks</li>
                            <li>
                                <!-- Inner menu: contains the tasks -->
                                <ul class="menu">
                                    <li>
                                        <!-- Task item --> <a href="#"> <!-- Task title and progress text -->
                                        <h3>
                                            Design some buttons <small class="pull-right">20%</small>
                                        </h3> <!-- The progress bar -->
                                        <div class="progress xs">
                                            <!-- Change the css width attribute to simulate progress -->
                                            <div class="progress-bar progress-bar-aqua"
                                                 style="width: 20%" role="progressbar" aria-valuenow="20"
                                                 aria-valuemin="0" aria-valuemax="100">
                                                <span class="sr-only">20% Complete</span>
                                            </div>
                                        </div>
                                    </a>
                                    </li>
                                    <!-- end task item -->
                                </ul>
                            </li>
                            <li class="footer"><a href="#">View all tasks</a></li>
                        </ul>
                    </li>
                    <!-- User Account Menu -->
                    <li class="dropdown user user-menu">
                        <!-- Menu Toggle Button --> <a href="#" class="dropdown-toggle"
                                                       data-toggle="dropdown"> <!-- The user image in the navbar-->
                        <img src="${contextPath}/resources/dist/img/avatar5.png" class="user-image" alt="User Image">
                        <!-- hidden-xs hides the username on small devices so only the image appears. -->
                        <span class="hidden-xs">${pageContext.request.userPrincipal.name}</span>
                    </a>
                        <ul class="dropdown-menu">
                            <!-- The user image in the menu -->
                            <li class="user-header"><img src="${contextPath}/resources/dist/img/avatar5.png"
                                                         class="img-circle" alt="User Image">

                                <p>
                                    ${pageContext.request.userPrincipal.name} - Web Developer <small>Member since Nov.
                                    2019</small>
                                </p></li>
                            <!-- Menu Body -->
                            <li class="user-body">
                                <div class="row">
                                    <div class="col-xs-4 text-center">
                                        <a href="#">Followers</a>
                                    </div>
                                    <div class="col-xs-4 text-center">
                                        <a href="#">Sales</a>
                                    </div>
                                    <div class="col-xs-4 text-center">
                                        <a href="#">Friends</a>
                                    </div>
                                </div> <!-- /.row -->
                            </li>
                            <!-- Menu Footer-->
                            <li class="user-footer">
                                <div class="pull-left">
                                    <a href="#" class="btn btn-default btn-flat">Profile</a>
                                </div>
                                <div class="pull-right">
                                    <form action="${contextPath}/logout" method="get">
                                        <button class="btn btn-md btn-danger btn-block"
                                                name="registration" type="Submit">Logout</button>
                                    </form>
                                </div>
                            </li>
                        </ul>
                    </li>
                    <!-- Control Sidebar Toggle Button -->
                    <li><a href="#" data-toggle="control-sidebar"><i
                            class="fa fa-gears"></i></a></li>
                </ul>
            </div>
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

            <!-- search form (Optional) -->
            <form action="#" method="get" class="sidebar-form">
                <div class="input-group">
                    <input type="text" name="q" class="form-control"
                           placeholder="Search..."> <span class="input-group-btn">
							<button type="submit" name="search" id="search-btn"
                                    class="btn btn-flat">
								<i class="fa fa-search"></i>
							</button>
						</span>
                </div>
            </form>
            <!-- /.search form -->

            <!-- Sidebar Menu -->
            <ul class="sidebar-menu">
                <li class="header">Menu Management</li>
                <!-- Optionally, you can add icons to the links -->
                <%--                <li class="active"><a href="/menu/list"><i--%>
                <%--                        class="glyphicon glyphicon-lock"></i> <span>Account--%>
                <%--								Management</span></a></li>--%>
                <li class="active"><a href="/catalogue"><i
                        class="glyphicon glyphicon-lock"></i> <span>Category
								Management</span></a></li>
                <li class="active"><a class="" href="/menu/list"><i
                        class="glyphicon glyphicon-home"></i> <span>Menu
								Management</span></a></li>
                <li class="active"><a class="" href="#"><i
                        class="glyphicon glyphicon-info-sign"></i> <span>Introduce
								About Web</span></a></li>

                <li class="active"><a class="" href="#"><i
                        class="glyphicon glyphicon-question-sign"></i> <span>Help
								Us !</span></a></li>
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
                Admin System: <small>Dante Restaurant</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> Level</a></li>
                <li class="active">Here</li>
            </ol>
        </section>

        <!-- Main content -->
        <section class="content">
            <div class="container">
                <table class="table table-striped">
                    <tbody>
                    <tr>
                        <td colspan="1"><img alt="this is logo"
                                             src="https://foody364.files.wordpress.com/2016/10/wallpaper-food-drink-cocktail-cake-pasta-pizza-awesome-85.jpg?w=1200" style="width: 30%;margin-left: 30%; display: block;">
                            <h2>Item Category </h2> <spring:url value="/save/catalogue"
                                                            var="saveURL" />
                            <fieldset>
                                <form:form modelAttribute="catalogue" method="POST"
                                           action="${saveURL}" cssClass="well form-horizontal" >

                                    <div class="form-group" style="display: none">
                                        <label class="control-label col-sm-2 requiredField">
                                            ID  <span class="asteriskField"> * </span>
                                        </label>
                                        <c:choose>
                                            <c:when test="${not empty catalogue.idCatalogue }">
                                                <div class="col-md-8 inputGroupContainer">
                                                    <div class="input-group">
																<span class="input-group-addon"><i
                                                                        class="glyphicon glyphicon-user"></i></span>
                                                        <form:input path="idCatalogue" cssClass="form-control"
                                                                    required="required" readonly="true" />
                                                    </div>
                                                </div>
                                            </c:when>
                                            <c:otherwise>
                                                <div class="col-md-8 inputGroupContainer">
                                                    <div class="input-group">
																<span class="input-group-addon"><i
                                                                        class="glyphicon glyphicon-user"></i></span>
                                                        <form:input id="id" path="idCatalogue"
                                                                    cssClass="form-control" readonly="true" />
                                                    </div>
                                                </div>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>

                                    <div class="form-group">
                                        <label class="control-label col-sm-2 requiredField">
                                            Tên Category <span class="asteriskField"> *</span>
                                        </label>
                                        <div class="col-md-8 inputGroupContainer">
                                            <div class="input-group">
                                                    <span class="input-group-addon"><i
                                                            class="glyphicon glyphicon-list-alt"></i></span>
                                                <form:input path="ten" id="ten"
                                                            placeholder="nhập tên catagory" class="form-control"
                                                            required="true" type="text" require="true"></form:input>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-sm-2 requiredField">
                                            Mô tả Catelogy <span class="asteriskField"> *</span>
                                        </label>
                                        <div class="col-md-8 inputGroupContainer">
                                            <div class="input-group">
														<span class="input-group-addon"><i
                                                                class="glyphicon glyphicon-list-alt"></i></span>
                                                <form:textarea path="chitiet"
                                                               placeholder="nhập mô tả catalogue" class="form-control" rows="3"
                                                               required="true" type="text" require="true"></form:textarea>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="text-center">
                                        <button type="submit" class="btn btn-primary">Save</button>
                                        <a type="button" class="btn btn-primary" href="/catalogue"
                                           onclick="return confirm('Bạn chắc chắn muốn ngừng thực hiện tác vụ không ?')">Cancel</a>
                                    </div>

                                </form:form>
                            </fieldset></td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </section>


        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->

    <!-- Main Footer -->
    <footer class="main-footer">
        <!-- To the right -->
        <div class="pull-right hidden-xs">Dante </div>
        <!-- Default to the left -->
        <strong>Admin <a href="#">Dante
            Restaurant</a>
        </strong>
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
        <!-- Tab panes -->
        <div class="tab-content">
            <!-- Home tab content -->
            <div class="tab-pane active" id="control-sidebar-home-tab">
                <h3 class="control-sidebar-heading">Recent Activity</h3>
                <!-- /.control-sidebar-menu -->

                <h3 class="control-sidebar-heading">Tasks Progress</h3>

                <!-- /.control-sidebar-menu -->

            </div>
            <!-- /.tab-pane -->
            <!-- Stats tab content -->
            <div class="tab-pane" id="control-sidebar-stats-tab">Stats Tab
                Content</div>
            <!-- /.tab-pane -->
            <!-- Settings tab content -->
            <div class="tab-pane" id="control-sidebar-settings-tab">
                <form method="post">
                    <h3 class="control-sidebar-heading">General Settings</h3>

                    <div class="form-group">
                        <label class="control-sidebar-subheading"> Report panel
                            usage <input type="checkbox" class="pull-right" checked>
                        </label>

                        <p>Some information about this general settings option</p>
                    </div>
                    <!-- /.form-group -->
                </form>
            </div>
            <!-- /.tab-pane -->
        </div>
    </aside>
    <!-- /.control-sidebar -->
    <!-- Add the sidebar's background. This div must be placed
   immediately after the control sidebar -->
    <div class="control-sidebar-bg"></div>
</div>
<!-- ./wrapper -->
<script>

</script>
<!-- REQUIRED JS SCRIPTS -->
<!-- jQuery 2.2.0 -->
<script src="${contextPath}/resources/plugins/jQuery/jQuery-2.2.0.min.js"></script>
<!-- Bootstrap 3.3.6 -->
<script src="${contextPath}/resources/bootstrap/js/bootstrap.min.js"></script>
<!-- AdminLTE App -->
<script src="${contextPath}/resources/dist/js/app.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

</body>
</html>