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
          <th>회원ID</th>
          <th>유저이름</th>
          <th>유저상태</th>
          <th>생성일</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="user" items="${userList}">
          <tr onclick="location.href='${pageContext.request.contextPath}/main/users/detail?id=${user.userId}'" style="cursor:pointer;">
            <td>${user.userId}</td>
            <td>${user.userName}</td>
            <td>${user.userStatus}</td>
            <td>${user.createdDate}</td>
          </tr>
        </c:forEach>
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