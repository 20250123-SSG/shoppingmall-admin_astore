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
        <a class="nav-link" href="${contextPath}/testproducts">
          상품관리
        </a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="${contextPath}/testorders">
          주문관리
        </a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="${contextPath}/testinquiries">
          문의관리
        </a>
      <li class="nav-item">
        <a class="nav-link" href="${contextPath}/stores">
          매장관리
        </a>
      </li>
    </ul>
  </div>
</nav>
<div id="sidebar-trigger"></div>

<script src="${contextPath}/resources/js/common/sidebar.js"></script>