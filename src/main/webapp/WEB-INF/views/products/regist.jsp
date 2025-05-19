<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<%@ include file="../common/header.jsp" %>
<%@ include file="../common/sidebar.jsp" %>

<!-- 컨텍스트 경로를 JavaScript에서 사용하기 위한 메타 태그 -->
<meta name="context-path" content="${contextPath}">

<div class="content-wrapper">
  <h2 class="mb-4">상품 등록</h2>
  <div class="card">
    <div class="card-body">
      <form id="product-enroll-form" method="post" action="${pageContext.request.contextPath}/products/regist">
        <div class="mb-3">
          <label for="productName" class="form-label">제품명</label>
          <select id="productName" name="productName" class="form-control" required>
            <option value="">선택하세요</option>
            <option value="맥북">맥북</option>
            <option value="아이폰">아이폰</option>
            <option value="아이패드">아이패드</option>
          </select>
        </div>
        <div class="mb-3">
          <label for="modelName" class="form-label">모델명</label>
          <input type="text" class="form-control" id="modelName" name="modelName" required>
        </div>
        <div class="mb-3">
          <label for="price" class="form-label">가격</label>
          <input type="text" class="form-control" id="price" name="optionalModelPrice" required>
        </div>

        <br>

        <div class="mb-3">
          <label for="color" class="form-label">색상</label>
          <input type="text" class="form-control" id="color" name="color" required>
        </div>
        <div class="mb-3">
          <label for="ram" class="form-label">용량</label>
          <input type="text" class="form-control" id="ram" name="ram" required>
        </div>
        <div class="mb-3">
          <label for="size" class="form-label">사이즈</label>
          <input type="text" class="form-control" id="size" name="size" required>
        </div>
        <br>
        <div class="mb-3">
          <label for="description" class="form-label">제품 설명</label>
          <textarea class="form-control" id="description" name="modelDescription" rows="4" required></textarea>
        </div>
        <div align="center">
          <button type="submit" class="btn btn-success">등록하기</button>
        </div>
      </form>
    </div>
  </div>
</div>

<%@ include file="../common/footer.jsp" %>


<script>
</script>

