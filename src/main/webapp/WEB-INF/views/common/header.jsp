<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!-- Bootstrap CDN -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<style>
  header { height: 50px; }
  header a { color: white; }
  header .profile-img { width: 30px; }

  .navbar-brand img {
    height: 30px;      /* 로고 높이를 30px로 고정 */
    width: auto;       /* 너비는 비율에 맞춰 자동 */
  }
</style>

<nav class="navbar m-3 navbar-expand-sm bg-dark navbar-dark">
  <a class="navbar-brand" href="${contextPath}/dashboard">
    <img src="${contextPath}/resources/images/main_logo.png" alt="Home">
  </a>

  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#mainNav">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse justify-content-center" id="mainNav">
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" href="${contextPath}/testusers">유저관리</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="${contextPath}/testproducts">상품관리</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="${contextPath}/testorders">주문관리</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="${contextPath}/testinquiries">문의관리</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="${contextPath}/stores/list.page">매장관리</a>
      </li>
    </ul>
  </div>
</nav>