<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<link rel="stylesheet" href="${contextPath}/resources/css/common/sidebar.css">

<nav id="sidebar">
  <div class="position-sticky pt-3">
    <ul class="nav flex-column">
      <li class="nav-item">
        <a class="nav-link" href="${contextPath}/users/list">
          유저관리
        </a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="${contextPath}/products">
          상품관리
        </a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="${contextPath}/sales/order">
          주문관리
        </a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="${contextPath}/inquiries">
          문의관리
        </a>
      <li class="nav-item">
        <a class="nav-link" href="${contextPath}/stores/list.page">
          매장관리
        </a>
      </li>
    </ul>
  </div>
</nav>
<div id="sidebar-trigger"></div>

<script src="${contextPath}/resources/js/common/sidebar.js"></script>