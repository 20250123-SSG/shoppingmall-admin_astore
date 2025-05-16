<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="../common/header.jsp" %>
<%@ include file="../common/sidebar.jsp" %>

<div class="content-wrapper">
  <h2 class="mb-4">회원 관리</h2>
  
  <div class="card">
    <div class="card-body">
      <table class="table">
        <thead>
          <tr>
            <th>회원ID</th>
            <th>이름</th>
            <th>이메일</th>
            <th>포인트</th>
            <th>상태</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td>user1</td>
            <td>김철수</td>
            <td>kim@test.com</td>
            <td>1000</td>
            <td>정상</td>
          </tr>
          <tr>
            <td>user2</td>
            <td>이영희</td>
            <td>lee@test.com</td>
            <td>2000</td>
            <td>정상</td>
          </tr>
          <tr>
            <td>user3</td>
            <td>박지민</td>
            <td>park@test.com</td>
            <td>500</td>
            <td>휴면</td>
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
  const memberLink = document.querySelector('a[href="/members"]');
  if (memberLink) {
    memberLink.classList.add('active');
  }
});
</script> 