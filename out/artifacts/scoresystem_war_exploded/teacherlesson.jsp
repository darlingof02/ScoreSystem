<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ldx44
  Date: 2019/12/2
  Time: 15:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% String lessoncode = "xixi";
    String sno = null; %>
<%!
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Bootstrap Material Admin by Bootstrapious.com</title>
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
                        <!-- Navbar Brand --><a href="index.html" class="navbar-brand d-none d-sm-inline-block">
                        <div class="brand-text d-none d-lg-inline-block">
                            <span>四川大学 </span><strong>成绩管理系统</strong></div>
                        <div class="brand-text d-none d-sm-inline-block d-lg-none"><strong>BD</strong></div>
                    </a>
                        <!-- Toggle Button--><a id="toggle-btn" href="#"
                                                class="menu-btn active"><span></span><span></span><span></span></a>
                    </div>
                    <!-- Navbar Menu -->
                    <ul class="nav-menu list-unstyled d-flex flex-md-row align-items-md-center">
                        <!-- Search-->

                        <!-- Notifications-->

                        <!-- Messages                        -->

                        <!-- Languages dropdown    -->

                        <!-- Logout    -->
                        
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
                <li><a href="teachermainpage.jsp" onclick="document.getElementById('rehome').submit();return false;"> <i class="icon-home"></i>Home </a></li>


                <form action = "TeacherLesson" method="post" id="teacherLesson">
                    <input type="hidden" name="account_teacher" value="${account_teacher}">
                    <input type="hidden" name="password" value="${password}">
                </form>
                <li class="active"><a href="#" onclick="document.getElementById('teacherLesson').submit();return false;"><i class="icon-grid"></i>Tables </a></li>

                
                <form action = "tinfo" method="post" id="teacherinfo">
                    <input type="hidden" name="account_teacher" value="${account_teacher}">
                    <input type="hidden" name="password" value="${password}">
                </form>
                <li><a href="#" onclick="document.getElementById('teacherinfo').submit();return false;"><i class="icon-grid"></i>Forms </a></li>
                
               
            </ul>
           
        </nav>
        <div class="content-inner">
            <!-- Page Header-->
            <header class="page-header">
                <div class="container-fluid">
                    <h2 class="no-margin-bottom">Tables</h2>
                </div>
            </header>
            <!-- Breadcrumb-->
            <div class="breadcrumb-holder container-fluid">
                <ul class="breadcrumb">
                    <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                    <li class="breadcrumb-item active">Tables</li>
                </ul>
            </div>
            <section class="tables">

                <form method="post" action="Scorechange" class="form-horizontal" role="form" id="form_data"
                      style="margin: 20px;" onclick="confirmOrder();">
                    <div class="modal fade" id="addUserModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
                         aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                        &times;
                                    </button>
                                    <h4 class="modal-title" id="myModalLabel">
                                         成绩修改
                                    </h4>
                                </div>
                                <div class="modal-body">
                                    <form class="form-horizontal" role="form">
                                        <div class="form-group">
                                            <label  class="col-sm-3 control-label">学生学号</label>
                                            <div class="col-sm-9">
                                                <input type="text" class="form-control" id="fstudent_ID"
                                                       name="fstudent_ID" value=""
                                                       readonly="readonly">
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label  class="col-sm-3 control-label">课程编号</label>
                                            <div class="col-sm-9">
                                                <input type="text" class="form-control" name="flesson_code" value=""
                                                       id="flesson_code"
                                                       readonly="readonly">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label">平时成绩</label>
                                            <div class="col-sm-9">
                                                <input type="text" class="form-control" name="UsualPerformance" value=""
                                                       id="UsualPerformance"
                                                       >
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label  class="col-sm-3 control-label">出勤</label>
                                            <div class="col-sm-9">
                                                <input type="text" class="form-control" name="Attendance" value=""
                                                       id="Attendance"
                                                       >
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label  class="col-sm-3 control-label">期末成绩</label>
                                            <div class="col-sm-9">
                                                <input type="text" class="form-control" name="FinalScore" value=""
                                                       id="FinalScore"
                                                       >
                                            </div>
                                        </div>
                                        <input type="hidden" name="account_teacher" value="${account_teacher}">
                                        <input type="hidden" name="password" value="${password}">


                                    </form>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                                    </button>
                                    <button type="submit" class="btn btn-primary" >
                                        提交
                                    </button>
                                    <span id="tip"> </span>
                                </div>
                            </div><!-- /.modal-content -->
                        </div><!-- /.modal -->
                    </div>



                    <div class="col-lg-6">
                        <c:forEach items="${Relation}" var="list1" varStatus="loop1">
                            <div class="card">
                                <div class="card-close">
                                    <div class="dropdown">
                                        <button type="button" id="closeCard2" data-toggle="dropdown"
                                                aria-haspopup="true"
                                                aria-expanded="false" class="dropdown-toggle"><i
                                                class="fa fa-ellipsis-v"></i></button>
                                        <div aria-labelledby="closeCard2"
                                             class="dropdown-menu dropdown-menu-right has-shadow"><a href="#"
                                                                                                     class="dropdown-item remove">
                                            <i class="fa fa-times"></i>Close</a><a href="#"
                                                                                   onclick="document.getElementById('edit').submit();return false;"
                                                                                   class="dropdown-item edit"> <i
                                                class="fa fa-gear"></i>Edit</a></div>
                                    </div>
                                </div>
                                <div class="card-header d-flex align-items-center">
                                    <h3 class="h4">${teacherlesson[loop1.count-1].getLesson_name()} ${Relation[loop1.count-1].getLesson_code()} 通过率：${PassRate[loop1.count-1]*100}%</h3>
                                </div>

                                <div class="card-body">
                                    <div class="table-responsive">
                                        <table class="table table-striped">
                                            <thead>

                                            <tr>
                                                <th>#</th>
                                                <th>学号</th>
                                                <th>姓名</th>
                                                <th>平时成绩</th>
                                                <th>出勤</th>
                                                <th>期末成绩</th>
                                                <th>总评</th>
                                                <th>绩点</th>
                                            </tr>

                                            </thead>

                                            <tbody>


                                            <c:forEach items="${Stu[loop1.count-1]}" var="list2" varStatus="loop2">
                                                <tr>
                                                    <td>${loop2.count}</td>
                                                    <td>${Score[loop1.count-1][loop2.count-1].getStudent_ID()}</td>
                                                    <td>${list2}</td>
                                                    <td>${Score[loop1.count-1][loop2.count-1].getUsual_score()}</td>
                                                    <td>${Score[loop1.count-1][loop2.count-1].getAttend_score()}</td>
                                                    <td>${Score[loop1.count-1][loop2.count-1].getFinalexam_score()}</td>

                                                    <td>${Score[loop1.count-1][loop2.count-1].getAttend_score()* 0.2 + Score[loop1.count-1][loop2.count-1].getFinalexam_score()*0.5 +
                                                            Score[loop1.count-1][loop2.count-1].getUsual_score()*0.3}
                                                    </td>
                                                    <td>${gpq[loop1.count-1][loop2.count-1]}</td>
                                                    <td>
                                                        <button type="button" class="btn btn-info" data-toggle="modal"
                                                                data-target="#addUserModal" onclick="get_modal_info('${Score[loop1.count-1][loop2.count-1].getLesson_code()}','${Score[loop1.count-1][loop2.count-1].getStudent_ID()}')" >
                                                            编辑
                                                        </button>
                                                        &nbsp;&nbsp;
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </form>
            </section>
        </div>
    </div>
</div>
<%--

                                    </table>
                                </div>
                            </div>
                        </div>

                    </div>
<%--                    </c:forEach>--%>

<!-- Page Footer-->

</div>
</div>
</div>
<!-- JavaScript files-->
<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/popper.js/umd/popper.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<script src="vendor/jquery.cookie/jquery.cookie.js"></script>
<script src="vendor/chart.js/Chart.min.js"></script>
<script src="vendor/jquery-validation/jquery.validate.min.js"></script>
<!-- Main File-->
<script src="js/front.js"></script>
<script>
    function get_modal_info(lesson_code, student_num) {
        student_num = student_num.toString()
        lesson_code = lesson_code.toString()
        var input1 = document.getElementById("fstudent_ID")
        var input2 = document.getElementById("flesson_code")
        input1.value = student_num
        input2.value = lesson_code
    }
    function confirmOrder(){
        $("#addUserModal").submit();
    }

</script>
</body>
</html>

