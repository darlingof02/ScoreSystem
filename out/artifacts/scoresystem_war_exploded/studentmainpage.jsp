<%@ page import="java.util.Collection" %>
<%@ page import="model.Lessonmessage" %>
<%--
  Created by IntelliJ IDEA.
  User: ldx44
  Date: 2019/12/1
  Time: 14:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Lessonmessage[] lemessage= (Lessonmessage[]) request.getAttribute("lemessage");
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                    <p>${major}</p>
                </div>
            </div>
            <!-- Sidebar Navidation Menus--><span class="heading">Main</span>
            <ul class="list-unstyled">
                    <form action = "Studentlogin" method="post" id="rehome">
                        <input type="hidden" name="account_student" value="${account_student}">
                        <input type="hidden" name="password" value="${password}">
                    </form>
                <li class="active"><a href="#" onclick="document.getElementById('rehome').submit();return false;"> <i class="icon-home"></i>Home </a></li>


                <form action = "StudentLesson" method="post" id="myLesson">
                    <input type="hidden" name="account_student" value="${account_student}">
                    <input type="hidden" name="password" value="${password}">
                </form>
                <li><a href="lessonmessage.jsp" onclick="document.getElementById('myLesson').submit();return false;"><%--<a href="#" onclick="document.getElementById('myLesson').submit();return false;"> --%><i class="icon-grid"></i>Tables </a></li>
               

                <form action = "info" method="post" id="infologin">
                    <input type="hidden" name="account_student" value="${account_student}">
                    <input type="hidden" name="password" value="${password}">
                </form>
                <li><a href="#" onclick="document.getElementById('infologin').submit();return false;"> <i class="icon-padnote"></i>Forms </a></li>
               
          
        </nav>
        <div class="content-inner">
            <!-- Page Header-->
            <header class="page-header">
                <div class="container-fluid">
                    <h2 class="no-margin-bottom">首页</h2>
                </div>
            </header>
            <!-- Dashboard Counts Section-->
            <section class="dashboard-counts no-padding-bottom">
                <div class="container-fluid">
                    <div class="row bg-white has-shadow">
                        <!-- Item -->
                        <div class="col-xl-3 col-sm-6">
                            <div class="item d-flex align-items-center">
                                <div class="icon bg-violet"><i class="icon-user"></i></div>
                                <div class="title"><span>全部<br>学分</span>
                                    <div class="progress">
                                        <div role="progressbar" style="width: 25%; height: 4px;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100" class="progress-bar bg-violet"></div>
                                    </div>
                                </div>
                                <div class="number"><strong>${Revised_credits}</strong></div>
                            </div>
                        </div>
                        <!-- Item -->
                        <div class="col-xl-3 col-sm-6">
                            <div class="item d-flex align-items-center">
                                <div class="icon bg-red"><i class="icon-padnote"></i></div>
                                <div class="title"><span>已过<br>学分</span>
                                    <div class="progress">
                                        <div role="progressbar" style="width: 70%; height: 4px;" aria-valuenow="70" aria-valuemin="0" aria-valuemax="100" class="progress-bar bg-red"></div>
                                    </div>
                                </div>
                                <div class="number"><strong>${Revised_credits}</strong></div>
                            </div>
                        </div>
                        <!-- Item -->
                        <div class="col-xl-3 col-sm-6">
                            <div class="item d-flex align-items-center">
                                <div class="icon bg-green"><i class="icon-bill"></i></div>
                                <div class="title"><span>全部<br>绩点</span>
                                    <div class="progress">
                                        <div role="progressbar" style="width: 40%; height: 4px;" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" class="progress-bar bg-green"></div>
                                    </div>
                                </div>
                                <div class="number"><strong>${GPA}</strong></div>
                            </div>
                        </div>
                        <!-- Item -->
                        <div class="col-xl-3 col-sm-6">
                            <div class="item d-flex align-items-center">
                                <div class="icon bg-orange"><i class="icon-check"></i></div>
                                <div class="title"><span>平均<br>成绩</span>
                                    <div class="progress">
                                        <div role="progressbar" style="width: 50%; height: 4px;" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100" class="progress-bar bg-orange"></div>
                                    </div>
                                </div>
                                <div class="number"><strong>${Score}</strong></div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!-- Dashboard Header Section    -->
            <section class="dashboard-header">
                <div class="container-fluid">
                    <div class="row">
                        <!-- Statistics -->
                        <div class="statistics col-lg-3 col-12">
                            <div class="statistic d-flex align-items-center bg-white has-shadow">
                                <div class="icon bg-red"><i class="fa fa-tasks"></i></div>
                                <div class="text"><strong>${student_ID}</strong><br><small>Student ID</small></div>
                            </div>
                            <div class="statistic d-flex align-items-center bg-white has-shadow">
                                <div class="icon bg-green"><i class="fa fa-calendar-o"></i></div>
                                <div class="text"><strong>${TookNum}</strong><br><small>Class</small></div>
                            </div>
                            <div class="statistic d-flex align-items-center bg-white has-shadow">
                                <div class="icon bg-orange"><i class="fa fa-paper-plane-o"></i></div>
                                <div class="text"><strong>${PassNum}</strong><br><small>Pass Class</small></div>
                            </div>
                        </div>
                        <!-- Line Chart            -->

                        <div class="chart col-lg-3 col-12">
                            <!-- Bar Chart   -->
                            <div class="bar-chart has-shadow bg-white">
                                <div class="title"><strong class="text-violet">32%</strong><br><small>Rank</small></div>
                                <canvas id="barChartHome"></canvas>
                            </div>
                            <!-- Numbers-->
                            <div class="statistic d-flex align-items-center bg-white has-shadow">
                                <div class="icon bg-green"><i class="fa fa-line-chart"></i></div>
                                <div class="text"><strong>100%</strong><br><small>Pass Rate</small></div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!-- Projects Section-->

            <!-- Feeds Section-->

            <section class="updates no-padding-top">
            <div class="col-lg-4">
                <div class="recent-activities card">
                    <div class="card-close">
                        <div class="dropdown">
                            <button type="button" id="closeCard8" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="dropdown-toggle"><i class="fa fa-ellipsis-v"></i></button>
                            <div aria-labelledby="closeCard8" class="dropdown-menu dropdown-menu-right has-shadow"><a href="#" class="dropdown-item remove"> <i class="fa fa-times"></i>Close</a><a href="#" class="dropdown-item edit"> <i class="fa fa-gear"></i>Edit</a></div>
                        </div>
                    </div>
                    <div class="card-header">
                        <h3 class="h4">公告信息</h3>
                    </div>
                    <div class="card-body no-padding">

                        <c:forEach items="${lemessage}" var="list" varStatus="loop">
                            <c:if test="${list.isnotnull()}" >
                        <div class="item">
                            <div class="row">
                                <div class="col-4 date-holder text-right">
                                    <div class="icon"><i class="icon-clock"></i></div>

                                    <div class="date"> <span>${list.getLesson_code()}</span><br><span >${list.getDate()}</span></div>


                                </div>
                                <div class="col-8 content">
                                    <h5>${annouce[loop.count-1].getLesson_name()}</h5>
                                    <p>${list.getMessage()}</p>
                                </div>
                            </div>
                        </div>
                            </c:if>
                        </c:forEach>


                    </div>
                </div>
            </div>
            </section>

            <!-- Updates Section                                                -->

            <!-- Page Footer-->
            <footer class="main-footer">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-sm-6">
                            <p>Dadabase design &copy; 2019.12</p>
                        </div>
                        <div class="col-sm-6 text-right">
                            <p>Design by LDX </p>
                            <!-- Please do not remove the backlink to us unless you support further theme's development at https://bootstrapious.com/donate. It is part of the license conditions. Thank you for understanding :)-->
                        </div>
                    </div>
                </div>
            </footer>
        </div>
    </div>
</div>
<!-- JavaScript files-->
<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/popper.js/umd/popper.min.js"> </script>
<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<script src="vendor/jquery.cookie/jquery.cookie.js"> </script>
<script src="vendor/chart.js/Chart.min.js"></script>
<script src="vendor/jquery-validation/jquery.validate.min.js"></script>
<script src="js/charts-home.js"></script>
<!-- Main File-->
<script src="js/front.js"></script>

</body>
</html>
