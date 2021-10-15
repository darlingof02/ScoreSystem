<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.Collection" %>
<%@ page import="model.Lessonmessage" %>
<%@ page import="model.Lesson" %>
<%@ page import="model.Relationship" %>
<%--
  Created by IntelliJ IDEA.
  User: ldx44
  Date: 2019/12/1
  Time: 16:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Lesson[] teacherlesson=(Lesson[])request.getAttribute("teacherlesson");
    Relationship[] Relationship=(Relationship[])request.getAttribute("Relationship");
%>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Bootstrap Material Admin </title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="robots" content="all,follow">
    <!-- Bootstrap CSS-->
    <link rel="stylesheet" href="vendor/bootstrap/css/bootstrap.min.css">
    <!-- Font Awesome CSS-->
    <link rel="stylesheet" href="vendor/font-awesome/css/font-awesome.min.css">
    <!-- Fontastic Custom icon font-->
    <link rel="stylesheet" href="css/fontastic.css">
    <!-- Google fonts - Poppins -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins:300,400,700">
    <!-- theme stylesheet-->
    <link rel="stylesheet" href="css/style.default.css" id="theme-stylesheet">
    <!-- Custom stylesheet - for your changes-->
    <link rel="stylesheet" href="css/custom.css">
    <!-- Favicon-->
    <link rel="shortcut icon" href="img/favicon.ico">
    <!-- Tweaks for older IEs--><!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
</head>
<body>
<div class="page">
    <!-- Main Navbar-->
    <header class="header">
        <nav class="navbar">
            <!-- Search Box-->
            <div class="search-box">
                <button class="dismiss"><i class="icon-close"></i></button>
                <form id="searchForm" action="#" role="search">
                    <input type="search" placeholder="What are you looking for..." class="form-control">
                </form>
            </div>
            <div class="container-fluid">
                <div class="navbar-holder d-flex align-items-center justify-content-between">
                    <!-- Navbar Header-->
                    <div class="navbar-header">
                        <!-- Navbar Brand --><a href="studentmainpage.jsp" class="navbar-brand d-none d-sm-inline-block">
                        <div class="brand-text d-none d-lg-inline-block"><span>四川大学 </span><strong>成绩管理系统</strong></div>
                        <div class="brand-text d-none d-sm-inline-block d-lg-none"><strong>BD</strong></div></a>
                        <!-- Toggle Button--><a id="toggle-btn" href="#" class="menu-btn active"><span></span><span></span><span></span></a>
                    </div>
                    <!-- Navbar Menu -->
                    <ul class="nav-menu list-unstyled d-flex flex-md-row align-items-md-center">
                        <!-- Search-->

                        <!-- Notifications-->

                        <!-- Messages                        -->

                        <!-- Languages dropdown    -->

                        <!-- Logout    -->
                        <li class="nav-item"><a href="studentlogin.jsp" class="nav-link logout"> <span class="d-none d-sm-inline">Logout</span><i class="fa fa-sign-out"></i></a></li>
                    </ul>
                </div>
            </div>
        </nav>
    </header>
    <div class="page-content d-flex align-items-stretch">
        <!-- Side Navbar -->
        <nav class="side-navbar">
            <!-- Sidebar Header-->
            <div class="sidebar-header d-flex align-items-center">
                <div class="avatar"><img src="img/avatar-1.jpg" alt="..." class="img-fluid rounded-circle"></div>
                <div class="title">
                    <h1 class="h4">${name}</h1>
                    <p>${college}</p>
                </div>
            </div>
            <!-- Sidebar Navidation Menus--><span class="heading">Main</span>
            <ul class="list-unstyled">
                <form action = "Teacherlogin" method="post" id="rehome">
                    <input type="hidden" name="account_teacher" value="${account_teacher}">
                    <input type="hidden" name="password" value="${password}">
                </form>
                <li class="active"><a href="#" onclick="document.getElementById('rehome').submit();return false;"> <i class="icon-home"></i>Home </a></li>

                <form action = "TeacherLesson" method="post" id="teacherLesson">
                    <input type="hidden" name="account_teacher" value="${account_teacher}">
                    <input type="hidden" name="password" value="${password}">
                </form>
                <li><a href="#" onclick="document.getElementById('teacherLesson').submit();return false;"><i class="icon-grid"></i>Tables </a></li>

               
                <form action = "tinfo" method="post" id="teacherinfo">
                    <input type="hidden" name="account_teacher" value="${account_teacher}">
                    <input type="hidden" name="password" value="${password}">
                </form>
                <li><a href="#" onclick="document.getElementById('teacherinfo').submit();return false;"><i class="icon-grid"></i>Forms </a></li>
               
            
        </nav>
        <div class="content-inner">
            <!-- Page Header-->
            <header class="page-header">
                <div class="container-fluid">
                    <h2 class="no-margin-bottom">首页</h2>
                </div>
            </header>
            <!-- Dashboard Counts Section-->
            
            <!-- Dashboard Header Section    -->
            <section class="dashboard-header">
                <div class="container-fluid">
                    <div class="row">
                        <!-- Statistics -->
                        <div class="statistics col-lg-3 col-12">
                            <div class="statistic d-flex align-items-center bg-white has-shadow">
                                <div class="icon bg-red"><i class="fa fa-tasks"></i></div>
                                <div class="text"><strong>${teacher_ID}</strong><br><small>Teacher ID</small></div>
                            </div>
                            <div class="statistic d-flex align-items-center bg-white has-shadow">
                                <div class="icon bg-green"><i class="fa fa-calendar-o"></i></div>
                                <div class="text"><strong>讲师</strong><br><small>position</small></div>
                            </div>
                            <div class="statistic d-flex align-items-center bg-white has-shadow">
                                <div class="icon bg-orange"><i class="fa fa-paper-plane-o"></i></div>
                                <div class="text"><strong>计算机学院</strong><br><small>college</small></div>
                            </div>
                        </div>
                        <!-- Line Chart            -->

                        <div class="chart col-lg-3 col-12">
                            <!-- Bar Chart   -->
                           
                            <!-- Numbers-->
                            <div class="statistic d-flex align-items-center bg-white has-shadow">
                                <div class="icon bg-green"><i class="fa fa-line-chart"></i></div>
                                <div class="text"><strong>100%</strong><br><small>Access Rate</small></div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!-- Projects Section-->
            <!--这里用来显示课程信息并提供课程公告功能 -->

            <section class="projects no-padding-top">
                <div class="container-fluid">

                    <c:forEach items="${Relationship}" var="list" varStatus="loop">
                    <div class="project">
                        <div class="row bg-white has-shadow">
                            <div class="left-col col-lg-6 d-flex align-items-center justify-content-between">
                                <div class="project-title d-flex align-items-center">
                                    <div class="image has-shadow"><img src="img/project-2.jpg" alt="..." class="img-fluid"></div>
                                    <div class="text">
                                        <h3 class="h4">${teacherlesson[loop.count-1].getLesson_name()}</h3><small>${list.getLesson_code()}</small>
                                    </div>
                                </div>
                                <div class="project-date"><span class="hidden-sm-down">Today at 4:24 AM</span></div>
                            </div>
                            <div class="right-col col-lg-6 d-flex align-items-center">
                                <div class="time"><i class="fa fa-clock-o"></i>12:00 PM </div>
                                <div class="comments"><i class="fa fa-comment-o"></i>20</div>
                                <div class="project-progress">
                                    <div class="progress">
                                        <div role="progressbar" style="width: 60%; height: 6px;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100" class="progress-bar bg-green"></div>
                                    </div>
                                </div>
                                <button type="button" class="btn btn-info" data-toggle="modal"  data-target="#addUserModal" onclick="get_modal_info('${teacherlesson[loop.count-1].getLesson_name()}','${list.getLesson_code()}')" )>发布公告</button>
                            </div>
                        </div>
                    </div>
                    </c:forEach>

                </div>
            </section>


            <!-- Feeds Section-->

            <!-- Updates Section                                                -->

            <!-- Page Footer-->
            <footer class="main-footer">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-sm-6">
                            <p>Dadabase design &copy; 2019.12</p>
                        </div>
                        <div class="col-sm-6 text-right">
                            <p>Design by Dadabasegroup </p>
                            <!-- Please do not remove the backlink to us unless you support further theme's development at https://bootstrapious.com/donate. It is part of the license conditions. Thank you for understanding :)-->
                        </div>
                    </div>
                </div>
            </footer>
        </div>
    </div>
</div>

<!-- 模态对话框 -->
<form method="post" action="Teacherannounce" class="form-horizontal" role="form" id="form_data"  style="margin: 20px;" onclick="confirmOrder()">
    <div class="modal fade" id="addUserModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;
                    </button>
                    <h4 class="modal-title" id="myModalLabel">
                        公告信息
                    </h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" role="form">
                        <div class="form-group">
                            <label for="flesson_code" class="col-sm-3 control-label">课程编号</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" id="flesson_code" name="flesson_code2" value="44"
                                       readonly = "readonly">
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="flesson_name" class="col-sm-3 control-label">课程名</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" name="flesson_name2" value="55" id="flesson_name"
                                       readonly = "readonly">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="announcedate" class="col-sm-3 control-label">日期</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" name="announcedate" value="" id="announcedate"
                                       placeholder="日期">
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="remark" class="col-sm-3 control-label">公告信息</label>
                            <div class="col-sm-9">
                                <textarea  class="form-control"  name="remark" value="{remark}" id="remark"
                                                                                 placeholder="请输入公告信息">

                                </textarea>
                            </div>
                        </div>
                        <input type="hidden" name="account_teacher" value="${account_teacher}">
                        <input type="hidden" name="password" value="${password}">
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                    </button>
                    <button type="submit" class="btn btn-primary">
                        提交
                    </button><span id="tip"> </span>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
    </div>
</form>
<!-- JavaScript files-->
<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/popper.js/umd/popper.min.js"> </script>
<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<script src="vendor/jquery.cookie/jquery.cookie.js"> </script>
<script src="vendor/chart.js/Chart.min.js"></script>
<script src="vendor/jquery-validation/jquery.validate.min.js"></script>
<script src="js/charts-home.js"></script>
<script>
    function get_modal_info(lesson_name,lessoncode){
        lessoncode=lessoncode.toString()
        lesson_name=lesson_name.toString()
        var input1=document.getElementById("flesson_code")
        var input2=document.getElementById("flesson_name")
        input1.value=lessoncode
        input2.value=lesson_name
    }

    function confirmOrder(){
        $("#addUserModal").submit();
    }

</script>
<!-- Main File-->
<script src="js/front.js"></script>

</body>
</html>
