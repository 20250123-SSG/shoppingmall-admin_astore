<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Apple Store Admin</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="/resources/css/admin.css" rel="stylesheet">
  <style>
    #sidebar {
      position: fixed;
      left: -250px;
      height: 100vh;
      width: 250px;
      transition: all 0.3s ease;
      z-index: 1000;
      background-color: #f8f9fa;
      border-right: 1px solid #dee2e6;
    }
    
    #sidebar.show {
      left: 0;
    }
    
    #sidebar-trigger {
      position: fixed;
      left: 10px;
      top: 50%;
      transform: translateY(-50%);
      width: 30px;
      height: 30px;
      background: #0d6efd;
      border-radius: 50%;
      cursor: pointer;
      z-index: 999;
      display: flex;
      align-items: center;
      justify-content: center;
      color: white;
      font-size: 18px;
      transition: all 0.3s ease;
      box-shadow: 0 2px 5px rgba(0,0,0,0.2);
    }

    #sidebar-trigger:hover {
      background: #0b5ed7;
    }

    #sidebar-trigger::after {
      content: "›";
      transition: transform 0.3s ease;
    }

    #sidebar.show + #sidebar-trigger {
      left: 260px;
    }

    #sidebar.show + #sidebar-trigger::after {
      transform: rotate(180deg);
    }
    
    .content-wrapper {
      margin-left: 25px;
      transition: margin-left 0.3s ease;
      padding: 20px;
    }
    
    #sidebar.show ~ .content-wrapper {
      margin-left: 275px;
    }

    .nav-link {
      color: #495057;
      padding: 0.8rem 1rem;
      border-radius: 4px;
      margin: 2px 8px;
      transition: all 0.2s ease;
    }

    .nav-link:hover {
      background-color: #e9ecef;
      transform: translateX(5px);
    }

    .nav-link.active {
      background-color: #0d6efd;
      color: white;
    }
  </style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
  <div class="container-fluid">
    <a class="navbar-brand" href="/">ADMINISTRATOR</a>

    <div class="collapse navbar-collapse">
      <ul class="navbar-nav me-auto">
        <li class="nav-item">
          <a class="nav-link" href="/testinquiries">문의내역</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/testusers">회원관리</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/testorders">주문관리</a>
        </li>
      </ul>

      <ul class="navbar-nav">
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="adminDropdown" role="button" data-bs-toggle="dropdown">
            관리자
          </a>
          <ul class="dropdown-menu dropdown-menu-end">
            <li><a class="dropdown-item" href="/testadmin/profile">관리자정보</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="/logout">로그아웃</a></li>
          </ul>
        </li>
      </ul>
    </div>
  </div>
</nav>

<nav id="sidebar">
  <div class="position-sticky pt-3">
    <ul class="nav flex-column">
      <li class="nav-item">
        <a class="nav-link" href="/testinquiries">
          문의내역
        </a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/testusers">
          회원관리
        </a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/testorders">
          주문관리
        </a>
      </li>
    </ul>
  </div>
</nav>
<div id="sidebar-trigger"></div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script>
  // 사이드바 토글 기능
  const sidebarTrigger = document.getElementById('sidebar-trigger');
  const sidebar = document.getElementById('sidebar');
  
  sidebarTrigger.addEventListener('click', () => {
    sidebar.classList.toggle('show');
  });
  
  // 현재 페이지 메뉴 활성화
  document.addEventListener('DOMContentLoaded', () => {
    const currentPath = window.location.pathname;
    document.querySelectorAll('.nav-link').forEach(link => {
      if (currentPath.includes(link.getAttribute('href'))) {
        link.classList.add('active');
      }
    });
  });
</script>
</body>
</html>