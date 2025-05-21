<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<%@ include file="../common/header.jsp" %>
<%@ include file="../common/sidebar.jsp" %>

<meta name="context-path" content="${contextPath}">

<style>
    .flex-container {
        display: flex;
        gap: 40px;
        margin-top: 20px;
        align-items: flex-start;
    }

    .form-box {
        flex: 1;
        width: 40%;
    }

    .image-box {
        flex: 1;
        width: 40%;
        text-align: center;
    }

    .image-box img {
        width: 80%;
        height: auto;
        cursor: pointer;
        border: 1px solid #ddd;
        border-radius: 8px;
    }
</style>

<div class="content-wrapper">
  <h2 class="mb-4">상품 등록</h2>
    <form id="product-enroll-form" method="post" action="${pageContext.request.contextPath}/products/regist" enctype="multipart/form-data">
    <div class="flex-container">
      <div class="form-box">
        <div class="product-info">
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
            <label for="modelPrice" class="form-label">기본 가격</label>
            <input type="text" class="form-control" id="modelPrice" name="modelPrice" oninput="formatPrice(this)" required>
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
          <div class="mb-3">
            <label for="optionalModelPrice" class="form-label">옵션비용</label>
            <input type="text" class="form-control" id="optionalModelPrice" name="optionalModelPrice" oninput="formatPriceOption(this)" required>
          </div>
          <br>
          <div class="mb-3">
            <label for="description" class="form-label">제품 설명</label>
            <textarea class="form-control" id="description" name="modelDescription" rows="4" required></textarea>
          </div>
        </div>
      </div>
      <div class="image-box">
        <div class="image text-center">
          <img id="previewImg" src="${contextPath}/resources/images/defaultImg.PNG">
          <br>
          <br>
          <label for="uploadFile" class="btn btn-primary">이미지 첨부</label>
          <input type="file" name="uploadFile" id="uploadFile" style="display: none;">
        </div>
      </div>
    </div>
    <br>
    <br>
    <div align="center">
      <button type="submit" class="btn btn-success">등록하기</button>
    </div>
  </form>
</div>

<script>
  function formatPrice(input) {
    let value = input.value.replace(/[^0-9]/g, '');
    input.value = Number(value).toLocaleString();
  }
  function formatPriceOption(input) {
    let value = input.value.replace(/[^0-9]/g, '');
    input.value = Number(value).toLocaleString();
  }

  document.getElementById('uploadFile').addEventListener('change', evt => {
    const file = evt.target.files[0];

    if (file){
      const previewImg = new FileReader();
      previewImg.onload = function(e) {
        document.getElementById('previewImg').src = e.target.result;
      };
      previewImg.readAsDataURL(file);
    }
  })

  document.querySelector("form").addEventListener("submit", function() {
    const modelPrice = document.getElementById("modelPrice");
    const optionPrice = document.getElementById("optionalModelPrice");
    modelPrice.value= modelPrice.value.replace(/,/g, "");
    optionPrice.value = parseInt(modelPrice.value) + parseInt(optionPrice.value.replace(/,/g, ""));
  });
</script>

<%@ include file="../common/footer.jsp" %>



