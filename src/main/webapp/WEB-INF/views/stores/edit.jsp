<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp" %>
<%@ include file="../common/sidebar.jsp" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<div class="content-wrapper">
  <div class="d-flex justify-content-between align-items-center mb-4">
    <h2>매장 정보 수정</h2>
  </div>

  <div class="row">
    <div class="col-md-2">
      <div class="list-group"></div>
    </div>

    <div class="col-md-6">
      <div id="map" style="width:700px; height:500px; border:1px solid #dee2e6;"></div>
    </div>

    <div class="col-md-4">
      <div class="card">
        <div class="card-header bg-primary text-white">매장 정보 수정</div>
        <div class="card-body">
          <form action="${contextPath}/stores/${store.id}/edit" method="post">
            <div class="mb-3">
              <label for="storeName" class="form-label"><strong>매장명</strong></label>
              <input type="text" id="storeName" name="storeName" class="form-control"
                     value="${store.storeName}" required />
            </div>

            <div class="mb-3">
              <label for="storeNumber" class="form-label"><strong>매장번호</strong></label>
              <input type="text" id="storeNumber" name="storeNumber" class="form-control"
                     value="${store.storeNumber}" required />
            </div>

            <div class="mb-3">
              <label for="storeAddress" class="form-label"><strong>주소</strong></label>
              <input type="text" id="storeAddress" name="storeAddress" class="form-control"
                     value="${store.storeAddress}" required />
            </div>

            <div class="mb-3">
              <label for="storeZipCode" class="form-label"><strong>우편번호</strong></label>
              <input type="text" id="storeZipCode" name="storeZipCode" class="form-control"
                     value="${store.storeZipCode}" required />
            </div>

            <div class="mb-3">
              <label for="storeOffDay" class="form-label"><strong>휴무일</strong></label>
              <select id="storeOffDay" name="storeOffDay" class="form-select">
                <option value="1" ${store.storeOffDay == 1 ? 'selected' : ''}>월요일</option>
                <option value="2" ${store.storeOffDay == 2 ? 'selected' : ''}>화요일</option>
                <option value="3" ${store.storeOffDay == 3 ? 'selected' : ''}>수요일</option>
                <option value="4" ${store.storeOffDay == 4 ? 'selected' : ''}>목요일</option>
                <option value="5" ${store.storeOffDay == 5 ? 'selected' : ''}>금요일</option>
                <option value="6" ${store.storeOffDay == 6 ? 'selected' : ''}>토요일</option>
                <option value="7" ${store.storeOffDay == 7 ? 'selected' : ''}>일요일</option>
              </select>
            </div>
            <div class="card-footer text-end bg-white border-0">
              <button type="submit" class="btn btn-sm btn-primary me-2">저장</button>
              <a href="${contextPath}/stores/detail.page?id=${store.id}" class="btn btn-sm btn-secondary">취소</a>
            </div>
            <input type="hidden" id="storeLat" name="storeLat" value="${store.storeLat}">
            <input type="hidden" id="storeLon" name="storeLon" value="${store.storeLon}">
          </form>
        </div>
      </div>
    </div>
  </div>
</div>

<%@ include file="../common/footer.jsp" %>

<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=<spring:eval expression="@jskey['appkey']" />&libraries=services"></script>
<script>
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