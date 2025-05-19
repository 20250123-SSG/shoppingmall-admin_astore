<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp" %>
<%@ include file="../common/sidebar.jsp" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<div class="content-wrapper">
  <div class="d-flex justify-content-between align-items-center mb-4">
    <h2>매장 상세 정보</h2>
    <a href="${pageContext.request.contextPath}/stores" class="btn btn-secondary">목록으로</a>
  </div>

  <div class="row">
<%--    <!-- 좌측: 사진 리스트 -->--%>
    <div class="col-md-2">
      <div class="list-group">
<%--        <c:forEach var="img" items="${store.photos}">--%>
<%--          <img src="${img.url}"--%>
<%--               class="img-fluid mb-2"--%>
<%--               style="border:1px solid #dee2e6; cursor:pointer;"--%>
<%--               onclick="selectPhoto('${img.url}')"/>--%>
<%--        </c:forEach>--%>
<%--        <c:if test="${empty store.photos}">--%>
<%--          <div class="text-center text-muted">등록된 사진이 없습니다.</div>--%>
<%--        </c:if>--%>
      </div>
    </div>

    <!-- 가운데: 지도 -->
    <div class="col-md-6">
      <div id="map" style="width:100%; height:400px; border:1px solid #dee2e6;"></div>
    </div>

    <!-- 우측: 매장 정보 + 버튼 -->
    <div class="col-md-4">
      <div class="card">
        <div class="card-header bg-primary text-white">
          매장 정보
        </div>
        <div class="card-body">
          <p><strong>매장명:</strong> <c:out value="${store.storeName}"/></p>
          <p><strong>매장번호:</strong> <c:out value="${store.storeNumber}"/></p>
          <p><strong>주소:</strong> <c:out value="${store.storeAddress}"/></p>
          <p><strong>우편번호:</strong> <c:out value="${store.storeZipCode}"/></p>
<%--          <p><strong>위도/경도:</strong>--%>
<%--            <c:out value="${store.storeLat}"/> , <c:out value="${store.storeLon}"/>--%>
<%--          </p>--%>
        </div>
        <div class="card-footer text-end">
          <a href="${pageContext.request.contextPath}/stores/${store.id}/edit"
             class="btn btn-sm btn-primary me-2">수정</a>
          <form action="${pageContext.request.contextPath}/stores/${store.id}/delete"
                method="post" style="display:inline;">
            <button type="submit" class="btn btn-sm btn-danger"
                    onclick="return confirm('정말 삭제하시겠습니까?')">
              삭제
            </button>
          </form>
        </div>
      </div>
    </div>
  </div>
</div>

<%@ include file="../common/footer.jsp" %>

<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=<spring:eval expression="@jskey['appkey']" />&libraries=services"></script>

<script>
  function selectPhoto(url) {
    window.open(url, '_blank');
  }

  document.addEventListener('DOMContentLoaded', function() {
    const lat = parseFloat('${store.storeLat}');
    const lon = parseFloat('${store.storeLon}');
    const container = document.getElementById('map');
    const options = {
      center: new kakao.maps.LatLng(lat, lon),
      level: 3
    };
    const map = new kakao.maps.Map(container, options);
    const marker = new kakao.maps.Marker({
      position: new kakao.maps.LatLng(lat, lon),
      map: map
    });
  });
</script>
