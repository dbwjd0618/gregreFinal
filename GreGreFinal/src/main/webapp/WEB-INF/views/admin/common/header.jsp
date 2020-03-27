<%@page import="java.util.ArrayList"%>
<%@page import="kh.mclass.Igre.admin.model.vo.Admin"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>아이그레</title>
    <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
    <!-- Bootstrap 3.3.2 -->
    <link href="${pageContext.request.contextPath}/resources/css/admin/bootstrap.min.css" rel="stylesheet" type="text/css" />    
    <!-- FontAwesome 4.3.0 -->
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <!-- Ionicons 2.0.0 -->
    <link href="http://code.ionicframework.com/ionicons/2.0.0/css/ionicons.min.css" rel="stylesheet" type="text/css" />    
    <!-- Theme style -->
    <link href="${pageContext.request.contextPath}/resources/css/admin/AdminLTE.min.css" rel="stylesheet" type="text/css" />
    <!-- AdminLTE Skins. Choose a skin from the css/skins 
         folder instead of downloading all of them to reduce the load. -->
    <link href="${pageContext.request.contextPath}/resources/css/admin/_all-skins.min.css" rel="stylesheet" type="text/css" />
    <!-- iCheck -->
    <link href="${pageContext.request.contextPath}/resources/css/admin/blue.css" rel="stylesheet" type="text/css" />
    <!-- Morris chart -->
    <link href="${pageContext.request.contextPath}/resources/css/admin/morris.css" rel="stylesheet" type="text/css" />
    <!-- jvectormap -->
    <link href="${pageContext.request.contextPath}/resources/css/admin/jquery-jvectormap-1.2.2.css" rel="stylesheet" type="text/css" />
    <!-- Date Picker -->
    <link href="${pageContext.request.contextPath}/resources/css/admin/datepicker3.css" rel="stylesheet" type="text/css" />
    <!-- Daterange picker -->
    <link href="${pageContext.request.contextPath}/resources/css/admin/daterangepicker-bs3.css" rel="stylesheet" type="text/css" />
    <!-- bootstrap wysihtml5 - text editor -->
    <link href="${pageContext.request.contextPath}/resources/css/admin/bootstrap3-wysihtml5.min.css" rel="stylesheet" type="text/css" />
    <!-- jQuery 3.3.1  -->
    <script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script>
    
    <style>
    .logbtn{
    	color:black;
    }
    </style>
  </head>
  
  <body class="skin-blue">
    <div class="wrapper">
      
      <header class="main-header">
        <!-- Logo -->
        <a href="${pageContext.request.contextPath }/admin/index.do" class="logo" 
        style="background-image: url('${pageContext.request.contextPath}/resources/images/admin/logo.png'); 
        	   background-size:115px auto;
        	   background-repeat: no-repeat;
    		   background-position: center;"></a>
        <!-- Header Navbar: style can be found in header.less -->
        <nav class="navbar navbar-static-top" role="navigation">
          <!-- Sidebar toggle button-->
          <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
            <span class="sr-only">Toggle navigation</span>
          </a>
          <div class="navbar-custom-menu">
            <ul class="nav navbar-nav">
              <!-- User Account: style can be found in dropdown.less -->
              <li class="dropdown user user-menu">
                  <a href="${pageContext.request.contextPath}/admin/adminUpdate.do"><span class="hidden-xs">${adminLoggedIn.adminId}님 안녕하세요!</span></a>
              </li>
            </ul>
          </div>
        </nav>
      </header>
      <!-- Left side column. contains the logo and sidebar -->
      <aside class="main-sidebar">
        <!-- sidebar: style can be found in sidebar.less -->
        <section class="sidebar">
          <!-- Sidebar user panel -->
          <div class="user-panel">
            <div class="pull-left info">
              <p>관리자</p>
                  <button class="logbtn" type="button" onclick="location.href='${pageContext.request.contextPath}/admin/logout.do'">로그아웃</button>
            </div>
          </div>
          <!-- search form -->
          <form action="#" method="get" class="sidebar-form">
            <div class="input-group">
              <input type="text" name="q" class="form-control" placeholder="Search..."/>
              <span class="input-group-btn">
                <button type='submit' name='search' id='search-btn' class="btn btn-flat"><i class="fa fa-search"></i></button>
              </span>
            </div>
          </form>
          <!-- /.search form -->
          <!-- sidebar menu: : style can be found in sidebar.less -->
          <ul class="sidebar-menu">
            <li class="header">메뉴</li>
            <li class="treeview">
              <a href="#">
                <i class="fa fa-user"></i>
                <span>회원관리</span>
                <i class="fa fa-angle-left pull-right"></i>
                <!-- <span class="label label-primary pull-right">4</span> -->
              </a>
              <ul class="treeview-menu">
                <li><a href="${pageContext.request.contextPath }/admin/memberList.do"><i class="fa fa-circle-o"></i> 회원 목록</a></li>
                <li><a href="${pageContext.request.contextPath }/admin/memberList.do"><i class="fa fa-circle-o"></i> 회원 탈퇴</a></li>
                <li><a href="memberDeleteList.html"><i class="fa fa-circle-o"></i> 탈퇴 회원 관리</a></li>
              </ul>
            </li>
            <li>
              <a href="">
                <i class="fa fa-bell"></i> <span>신고</span> 
                <i class="fa fa-angle-left pull-right"></i>
                <!-- <small class="label pull-right bg-green">new</small> -->
              </a>
              <ul class="treeview-menu">
                <li><a href="declaration.html"><i class="fa fa-circle-o"></i> 신고 내역</a></li>
              </ul>
            </li>
            <li class="treeview">
              <a href="#">
                <i class="fa fa-edit"></i> <span>게시판</span>
                <i class="fa fa-angle-left pull-right"></i>
              </a>
              <ul class="treeview-menu">
                <li><a href="board.html"><i class="fa fa-circle-o"></i> 게시판 목록</a></li>
              </ul>
            </li>
            <li class="treeview">
              <a href="#">
                <i class="fa fa-user-secret"></i>
                <span>관리자 관리</span>
                <i class="fa fa-angle-left pull-right"></i>
              </a>
              <ul class="treeview-menu">
                <li><a href="memberAuthor.html"><i class="fa fa-circle-o"></i> 관리자 권한 수정</a></li>
              </ul>
            </li>
             <li class="treeview">
              <a href="#">
                <i class="fa fa-share"></i> <span>단체안내</span>
                <i class="fa fa-angle-left pull-right"></i>
              </a>
              <ul class="treeview-menu">
                <li><a href="mailbox.html"><i class="fa fa-circle-o"></i>단체 이메일</a></li>
                <li><a href="message.html"><i class="fa fa-circle-o"></i> 단체 문자</a></li>
              </ul>
            </li>
        </section>
        <!-- /.sidebar -->
      </aside>