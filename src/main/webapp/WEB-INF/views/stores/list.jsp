<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="../common/header.jsp" %>
<%@ include file="../common/sidebar.jsp" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<link rel="stylesheet" href="${contextPath}/resources/css/store/list.css">

<meta name="context-path" content="${contextPath}">

<div class="content-wrapper">
  <div class="d-flex justify-content-between align-items-center mb-4">
    <h2>매장 목록</h2>
    <div>
      <a href="${contextPath}/stores/regist.page" class="btn btn-primary">매장 등록</a>
    </div>
  </div>

  <div class="card">
    <div class="card-body p-0">
      <table class="table mb-0 text-center">
        <thead>
        <tr>
          <th>번호</th>
          <th>매장명</th>
          <th>매장번호</th>
          <th>주소</th>
          <th>휴무여부</th>
          <th>위치</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="store" items="${list}">
          <tr onclick="location.href='${contextPath}/stores/detail.page?id=${store.id}';">
            <td>${store.id}</td>
            <td>${store.storeName}</td>
            <td>${store.storeNumber}</td>
            <td>${store.storeAddress}</td>
            <td>${store.businessStatus}</td>
            <td>
              <button type="button" class="btn btn-info btn-sm show-map"
                      data-lat="${store.storeLat}"
                      data-lon="${store.storeLon}"
                      data-name="${store.storeName}">
                위치보기
              </button>
            </td>
          </tr>
        </c:forEach>
        <c:if test="${empty list}">
          <tr>
            <td colspan="6" class="text-center">등록된 매장이 없습니다.</td>
          </tr>
        </c:if>
        </tbody>
      </table>
      <ul id="paging_area" class="pagination d-flex justify-content-center">
        <li class="page-item ${page == 1 ? 'disabled' : ''}">
          <a class="page-link" href="${contextPath}/stores/list.page?page=${page - 1}">Previous</a>
        </li>
        <c:forEach var="p" begin="${beginPage}" end="${endPage}">
          <li class="page-item ${p == page ? 'active' : ''}">
            <a class="page-link" href="${contextPath}/stores/list.page?page=${p}">${p}</a>
          </li>
        </c:forEach>
        <li class="page-item ${page == totalPage ? 'disabled' : ''}">
          <a class="page-link" href="${contextPath}/stores/list.page?page=${page + 1}">Next</a>
      </ul>
    </div>
  </div>
</div>

<%@ include file="../common/footer.jsp" %>

<!-- 카카오맵 모달 -->
<div class="modal fade" id="mapModal" tabindex="-1" aria-labelledby="mapModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="mapModalLabel">매장 위치</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <div id="map"></div>
      </div>
    </div>
  </div>
</div>

<!-- Scripts -->
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=<spring:eval expression="@jskey['appkey']" />&libraries=services"></script>
<script src="${contextPath}/resources/js/store/list.js"/>