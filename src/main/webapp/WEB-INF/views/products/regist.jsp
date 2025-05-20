<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<%@ include file="../common/header.jsp" %>
<%@ include file="../common/sidebar.jsp" %>

<!-- 컨텍스트 경로를 JavaScript에서 사용하기 위한 메타 태그 -->
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

        </div>
      </div>
      <div class="image-box">
        <div class="image text-center">
          <img id="previewImg" src="${contextPath}/resources/images/defaultImg.PNG">
          <br>
          <br>
          <label for="uploadFile" class="btn btn-primary">이미지 첨부</label>
          <input type="file" name="uploadFile" id="uploadFile" style="display: none;"> <!--DTO바꿔야하나....-->
            <!--첨부파일클릭시, 업로드한 이미지 출력(미리보기)-->
            <input type="hidden" id="imagePath" name="imagePath" value=""> <!--추가작성필요-->
        </div>
      </div>
    </div>
    <br>
    <br>
    <div align="center">
      <button type="submit" class="btn btn-success">등록하기</button>
      <!--등록하기 클릭시, input데이터 넘어가고, 첨부파일은 resource경로에 저장되도록-->
    </div>
  </form>

</div>

<script>
  document.getElementById('uploadFile').addEventListener('change', evt => {
    const file = evt.target.files[0];

    if (file){ // 첨부파일에 뭔가가 들어오면
      const previewImg = new FileReader();
      previewImg.onload = function(e) {
        document.getElementById('previewImg').src = e.target.result; // 비동기 방식으로 preview image src에 뿌려준다.
      };
      previewImg.readAsDataURL(file);
    }
  })
</script>

<%@ include file="../common/footer.jsp" %>



