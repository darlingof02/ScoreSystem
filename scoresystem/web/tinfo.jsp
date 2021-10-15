
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
                        <div class="brand-text d-none d-lg-inline-block"><span>四川大学 </span><strong>成绩管理系统</strong></div>
                        <div class="brand-text d-none d-sm-inline-block d-lg-none"><strong>BD</strong></div></a>
                        <!-- Toggle Button--><a id="toggle-btn" href="#" class="menu-btn active"><span></span><span></span><span></span></a>
                    </div>
                    <!-- Navbar Menu -->
                    
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
                <li><a href="#" onclick="document.getElementById('teacherLesson').submit();return false;"><i class="icon-grid"></i>Tables </a></li>

                

                <form action = "tinfo" method="post" id="teacherinfo">
                    <input type="hidden" name="account_teacher" value="${account_teacher}">
                    <input type="hidden" name="password" value="${password}">
                </form>
                <li class="active"><a href="#" onclick="document.getElementById('teacherinfo').submit();return false;"><i class="icon-grid"></i>Forms </a></li>
                
             
          
            </ul>
        </nav>
        <div class="content-inner">
            <!-- Page Header-->
            <header class="page-header">
                <div class="container-fluid">
                    <h2 class="no-margin-bottom">Forms</h2>
                </div>
            </header>
            <!-- Breadcrumb-->
            <div class="breadcrumb-holder container-fluid">
                <ul class="breadcrumb">
                    <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                    <li class="breadcrumb-item active">Forms            </li>
                </ul>
            </div>
            <!-- Forms Section-->
            <section class="forms">
                <div class="container-fluid">
                    <div class="row">
                        <!-- Basic Form-->
                        <div class="col-lg-6">
                            <div class="card">
                                <div class="card-close">
                                    <div class="dropdown">
                                        <button type="button" id="closeCard1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="dropdown-toggle"><i class="fa fa-ellipsis-v"></i></button>
                                        <div aria-labelledby="closeCard1" class="dropdown-menu dropdown-menu-right has-shadow"><a href="#" class="dropdown-item remove"> <i class="fa fa-times"></i>Close</a><a href="#" class="dropdown-item edit"> <i class="fa fa-gear"></i>Edit</a></div>
                                    </div>
                                </div>
                                <div class="card-header d-flex align-items-center">
                                    <h3 class="h4">账号密码修改</h3>
                                </div>
                                <div class="card-body">
                                    <p>Account password modification</p>
                                    <form action="tpasswordchange" method="post">
                                        <div class="form-group">
                                            <label class="form-control-label">account</label>
                                            <input  placeholder="account" class="form-control" name="account_teacher">
                                        </div>
                                        <div class="form-group">
                                            <label class="form-control-label">Password</label>
                                            <input type="password" placeholder="Password" class="form-control" name="password">
                                        </div>
                                        <div class="form-group">
                                            <label class="form-control-label">New Password</label>
                                            <input type="password" placeholder="Password" class="form-control" name="newpassword">
                                        </div>
                                        <div class="form-group">
                                            <input type="submit" value="submit" class="btn btn-primary">
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <!-- Horizontal Form-->

                        <!-- Inline Form-->

                        <!-- Modal Form-->

                        <!-- Form Elements -->
                      
                    </div>
                </div>
            </section>
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
<!-- JavaScript files-->
<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/popper.js/umd/popper.min.js"> </script>
<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<script src="vendor/jquery.cookie/jquery.cookie.js"> </script>
<script src="vendor/chart.js/Chart.min.js"></script>
<script src="vendor/jquery-validation/jquery.validate.min.js"></script>
<!-- Main File-->
<script src="js/front.js"></script>
</body>
</html>