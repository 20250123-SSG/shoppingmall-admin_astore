<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp" %>
<%@ include file="../common/sidebar.jsp" %>

<div class="content-wrapper">
  <h2 class="mb-4">문의 내역</h2>
  
  <div class="card">
    <div class="card-body">
      <table class="table">
        <thead>
          <tr>
            <th>번호</th>
            <th>제목</th>
            <th>작성자</th>
            <th>모델</th>
            <th>상태</th>
            <th>등록일</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td>1</td>
            <td>배송문의</td>
            <td>김철수</td>
            <td>아이폰15</td>
            <td>답변대기</td>
            <td>2024-03-20</td>
          </tr>
          <tr>
            <td>2</td>
            <td>환불요청</td>
            <td>이영희</td>
            <td>맥북프로</td>
            <td>답변완료</td>
            <td>2024-03-19</td>
          </tr>
          <tr>
            <td>3</td>
            <td>제품문의</td>
            <td>박지민</td>
            <td>애플워치</td>
            <td>답변중</td>
            <td>2024-03-18</td>
          </tr>
        </tbody>
      </table>
    </div>
  </div>
</div>
<%@ include file="../common/footer.jsp" %>


<script>
document.addEventListener('DOMContentLoaded', function() {
  // 페이지 로드시 사이드바 활성화
  const inquiryLink = document.querySelector('a[href="/inquiries"]');
  if (inquiryLink) {
    inquiryLink.classList.add('active');
  }
});
</script>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/inquiries.css">
<script src="${pageContext.request.contextPath}/resources/js/inquiries.js"></script> 