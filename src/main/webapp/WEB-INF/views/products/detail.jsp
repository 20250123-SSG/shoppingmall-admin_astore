<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="../common/header.jsp" %>
<%@ include file="../common/sidebar.jsp" %>
<link rel="stylesheet" href="${contextPath}/resources/css/product/detail.css">
<script src="${contextPath}/resources/js/product/detail.js"></script>



<!-- ✅ 페이지 제목 -->
<h1 class="page-title" >상품상세조회</h1>

<div class="detail-container">
    <div class="left-section">
        <img src="${pageContext.request.contextPath}/resources/images/main_logo.png"
             alt="모델 이미지" class="model-image">
        <p class="model-description">${modelDescription}</p>
        <div class="left-button">
            <button onclick="location.href='${pageContext.request.contextPath}/products/list.page'">뒤로가기</button>
        </div>
    </div>

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
            <p>가격: <span id="priceArea">옵션을 선택해주세요</span></p>
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
