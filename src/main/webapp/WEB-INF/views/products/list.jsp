<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="../common/header.jsp" %>
<%@ include file="../common/sidebar.jsp" %>
<link rel="stylesheet" href="${contextPath}/resources/css/product/list.css">
<meta name="context-path" content="${contextPath}">

<div class="content-wrapper">
  <div class="product-header">
    <h1 style="text-align: center;">상품목록</h1>

    <div class="product-header-controls">
      <form id="searchForm" method="get" action="" class="search-form">
        <input type="text" name="keyword" id="keywordInput"
               placeholder="제품명, 모델명 검색" value="${keyword}" autocomplete="off" />
        <div id="autocomplete-box" class="autocomplete-box"></div>

        <button type="submit">검색</button>

        <select id="sortSelect">
          <option value="created" ${sort == 'created' ? 'selected' : ''}>생성순</option>
          <option value="price_asc" ${sort == 'price_asc' ? 'selected' : ''}>가격 낮은순</option>
          <option value="price_desc" ${sort == 'price_desc' ? 'selected' : ''}>가격 높은순</option>
          <option value="model" ${sort == 'model' ? 'selected' : ''}>모델명순</option>
        </select>

        <input type="hidden" name="sort" id="sortHidden" value="${sort}" />
      </form>


      <button type="button" onclick="location.href='${pageContext.request.contextPath}/products/regist'" class="register-button">
        상품 등록하기
      </button>
    </div>
  </div>

</div>



  <div class="card">
    <div class="card-body p-0">
      <table class="table fixed-table-layout table-hover">
        <thead>
        <tr>
          <th>제품명</th>
          <th>모델명</th>
          <th>모델가격</th>
          <th>생성일</th>
          <th>수정일</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="product" items="${list}">
          <tr class="product-row"
              onclick="location.href='${pageContext.request.contextPath}/products/${product.modelId}'"
              style="cursor: pointer;">
          <td>${product.productName}</td>
            <td>${product.modelName}</td>
            <td><fmt:formatNumber value="${product.modelPrice}" type="number" groupingUsed="true" /></td>
            <td>${product.createdAt.toLocalDate()}</td>
            <td>${product.modifiedAt.toLocalDate()}</td>
          </tr>
        </c:forEach>
        <c:if test="${empty list}">
          <tr><td colspan="5">등록된 상품이 없습니다.</td></tr>
        </c:if>
        </tbody>
      </table>
    </div>
  </div>

  <div class="pagination">
    <c:forEach var="i" begin="${pageInfo.beginPage}" end="${pageInfo.endPage}">
      <a href="?page=${i}&keyword=${keyword}&sort=${sort}" class="${i == pageInfo.page ? 'active' : ''} pagination-link">${i}</a>
    </c:forEach>
  </div>
</div>

<script src="${contextPath}/resources/js/product/list.js"></script>


<%@ include file="../common/footer.jsp" %>
