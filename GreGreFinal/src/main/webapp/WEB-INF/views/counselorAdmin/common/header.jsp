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
    <!--  font awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
    <!-- Bootstrap 3.3.2 -->
    <link href="${pageContext.request.contextPath}/resources/css/counselorAdmin/bootstrap.min.css" rel="stylesheet" type="text/css" />    
    <!-- FontAwesome 4.3.0 -->
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <!-- Ionicons 2.0.0 -->
    <link href="http://code.ionicframework.com/ionicons/2.0.0/css/ionicons.min.css" rel="stylesheet" type="text/css" />    
    <!-- Theme style -->
    <link href="${pageContext.request.contextPath}/resources/css/counselorAdmin/AdminLTE.min.css" rel="stylesheet" type="text/css" />
    <!-- AdminLTE Skins. Choose a skin from the css/skins 
         folder instead of downloading all of them to reduce the load. -->
    <link href="${pageContext.request.contextPath}/resources/css/counselorAdmin/_all-skins.min.css" rel="stylesheet" type="text/css" />
    <!-- iCheck -->
    <link href="${pageContext.request.contextPath}/resources/css/counselorAdmin/blue.css" rel="stylesheet" type="text/css" />
    <!-- Morris chart -->
    <link href="${pageContext.request.contextPath}/resources/css/counselorAdmin/morris.css" rel="stylesheet" type="text/css" />
    <!-- jvectormap -->
    <link href="${pageContext.request.contextPath}/resources/css/counselorAdmin/jquery-jvectormap-1.2.2.css" rel="stylesheet" type="text/css" />
    <!-- Date Picker -->
    <link href="${pageContext.request.contextPath}/resources/css/counselorAdmin/datepicker3.css" rel="stylesheet" type="text/css" />
    <!-- Daterange picker -->
    <link href="${pageContext.request.contextPath}/resources/css/counselorAdmin/daterangepicker-bs3.css" rel="stylesheet" type="text/css" />
    <!-- bootstrap wysihtml5 - text editor -->
    <link href="${pageContext.request.contextPath}/resources/css/counselorAdmin/bootstrap3-wysihtml5.min.css" rel="stylesheet" type="text/css" />
    <!-- jQuery 3.3.1  -->
    <script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script>
    
    <style>
    .logbtn{
    	color:black;
    	margin-left: 20px;
    	margin-top: 10px;
    	padding: 5px;
    	border-radius: 7px;
    }
    </style>
  </head>
  
  <body class="skin-blue">
      <header class="main-header">
        <!-- Logo -->
        <a href="${pageContext.request.contextPath }/counselorAdmin/index.do" class="logo" 
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
                  <a href="${pageContext.request.contextPath}/counselorAdmin/adminUpdate.do"><span class="hidden-xs">${adminLoggedIn.adminId}님 안녕하세요!</span></a>
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
              <p>${adminLoggedIn.adminName }
                  <button class="logbtn" type="button" onclick="location.href='${pageContext.request.contextPath}/counselorAdmin/logout.do'">로그아웃</button>
              </p>
            </div>
          </div>
          <!-- sidebar menu: : style can be found in sidebar.less -->
          <ul class="sidebar-menu">
           <!--  <li class="header">상담사</li> -->
           <br /><br />
            <li class="treeview">
              <a href="#">
                <i class="fas fa-users"></i>&nbsp;
                <span>일반</span>
                <i class="fa fa-angle-left pull-right"></i>
              </a>
              <ul class="treeview-menu">
                <li><a href="#"><i class="far fa-laugh-beam"></i>&nbsp;&nbsp;
                	회원 목록</a></li>
              </ul>
            </li>
            <li>
              <a href="">
                <i class="fas fa-user-secret"></i>&nbsp;&nbsp; <span>전문</span> 
                <i class="fa fa-angle-left pull-right"></i>
              </a>
              <ul class="treeview-menu">
                <li><a href="#"><i class="far fa-laugh-beam"></i>&nbsp;&nbsp;
               	 신고 내역</a></li>
              </ul>
            </li>
            <li class="treeview">
              <a href="#">
                <i class="fas fa-user-graduate"></i>&nbsp;&nbsp;
                <span>마스터</span>
                <i class="fa fa-angle-left pull-right"></i>
              </a>
              <ul class="treeview-menu">
                <li><a href="#"><i class="far fa-laugh-beam"></i>&nbsp;&nbsp;
                	 게시판 목록</a></li>
              </ul>
            </li>
          </ul>
        </section>
        <!-- /.sidebar -->
      </aside>