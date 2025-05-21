<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="../common/header.jsp" %>
<%@ include file="../common/sidebar.jsp" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<div class="content-wrapper">
  <h2 class="mb-4">매장 등록</h2>
  <div class="card">
    <div class="card-body">
      <form id="storeForm" method="post" action="${contextPath}/stores/new">
        <div class="mb-3">
          <label for="storeName" class="form-label">매장명</label>
          <input type="text" class="form-control" id="storeName" name="storeName" required>
        </div>
        <div class="mb-3">
          <label for="storeNumber" class="form-label">매장번호</label>
          <input type="text" class="form-control" id="storeNumber" name="storeNumber" required>
        </div>
        <div class="mb-3">
          <label for="storeOffDay" class="form-label">휴일</label>
          <select class="form-control" id="storeOffDay" name="storeOffDay" required>
            <option value="" disabled selected>요일을 선택하세요</option>
            <option value="1">월요일</option>
            <option value="2">화요일</option>
            <option value="3">수요일</option>
            <option value="4">목요일</option>
            <option value="5">금요일</option>
            <option value="6">토요일</option>
            <option value="7">일요일</option>
          </select>
        </div>
        <div class="mb-3">
          <label class="form-label">주소 찾기</label>
          <div class="input-group">
            <input type="text" class="form-control" id="storeAddress" name="storeAddress" placeholder="주소" readonly
                   required>
            <button type="button" class="btn btn-outline-secondary" id="btnPostcode">주소 검색</button>
          </div>
        </div>
        <input type="hidden" id="storeZipCode" name="storeZipCode">
        <input type="hidden" id="storeLat" name="storeLat">
        <input type="hidden" id="storeLon" name="storeLon">

        <button type="submit" class="btn btn-success">등록</button>
        <a href="${contextPath}/stores/list.page" class="btn btn-secondary">취소</a>
      </form>
    </div>
  </div>
</div>

<%@ include file="../common/footer.jsp" %>

<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=<spring:eval expression="@jskey['appkey']" />&libraries=services"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="${contextPath}/resources/js/store/regist.js"></script>
