<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="../common/header.jsp" %>
<%@ include file="../common/sidebar.jsp" %>
<link rel="stylesheet" href="${contextPath}/resources/css/product/list.css">
<meta name="context-path" content="${contextPath}">

<div class="content-wrapper">
  <div class="product-header">
    <h1 style="text-align: center;">상품목록</h1>

    <div class="product-filters" style="display: flex; align-items: center; justify-content: space-between; gap: 10px;">


      <form id="searchForm" method="get" action="" style="display: flex; gap: 10px; flex-grow: 1; max-width: 250px;">
        <div style="position: relative; flex-grow: 1;">
          <input type="text" name="keyword" id="keywordInput"
                 placeholder="제품명, 모델명 검색" value="${keyword}" autocomplete="off"
                 style="width: 100%;" />
          <div id="autocomplete-box" class="autocomplete-box"></div>
        </div>
        <button type="submit">검색</button>
      </form>

      <!-- 드롭다운: 오른쪽에 정렬 -->
      <div style="min-width: 150px;">
        <select name="sort" id="sortSelect" style="width: 100%;">
          <option value="created" ${sort == 'created' ? 'selected' : ''}>생성순</option>
          <option value="price_asc" ${sort == 'price_asc' ? 'selected' : ''}>가격 낮은순</option>
          <option value="price_desc" ${sort == 'price_desc' ? 'selected' : ''}>가격 높은순</option>
          <option value="model" ${sort == 'model' ? 'selected' : ''}>모델명순</option>
        </select>
      </div>

    </div>
  </div>



  <div class="card">
    <div class="card-body p-0">
      <table class="table table-hover">
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
          <tr class="product-row">
            <td>${product.productName}</td>
            <td>${product.modelName}</td>
            <td>${product.modelPrice}</td>
            <td>${product.createdAt}</td>
            <td>${product.modifiedAt}</td>
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

