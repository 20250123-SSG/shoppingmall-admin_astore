<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="../common/header.jsp" %>
<%@ include file="../common/sidebar.jsp" %>
<link rel="stylesheet" href="${contextPath}/resources/css/product/detail.css">
<script src="${contextPath}/resources/js/product/detail.js"></script>



<h1 class="page-title" >상품상세조회</h1>

<div class="detail-container">
    <div class="left-section">
        <img src="${pageContext.request.contextPath}/resources/images/main_logo.png"
             alt="모델 이미지" class="model-image">
        <p class="model-description" style="font-weight: bold">${modelDescription}</p>
        <div class="left-button">
            <button onclick="location.href='${pageContext.request.contextPath}/products/list.page'">뒤로가기</button>
        </div>
    </div>

    <input type="hidden" name="modelId" value="${modelId}"/>
    <div class="right-section">
        <h2 class="model-name">${modelName}</h2>

        <div>
            <label>색상:</label>
            <select id="colorSelect"></select>
        </div>

        <div>
            <label>RAM:</label>
            <select id="ramSelect"></select>
        </div>

        <div>
            <label>사이즈:</label>
            <select id="sizeSelect"></select>
        </div>

        <div>
            <label style="font-weight: bold;">가격:</label>
            <span id="priceDisplay" style="font-weight: bold;">
    <fmt:formatNumber value="${modelPrice}" type="number" groupingUsed="true" />원
  </span>
        </div>




        <div class="right-buttons">
            <button type="button" onclick="deleteOption()">삭제하기</button>
            <button onclick="editOption()">수정하기</button>
        </div>
    </div>
</div>

<script>
  const modelOptions = JSON.parse('${optionsJson}'); // ← Controller에서 JSON 문자열로 전달
</script>

<%@ include file="../common/footer.jsp" %>
