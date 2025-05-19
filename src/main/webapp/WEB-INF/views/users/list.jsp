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
          <th>유저이름</th>
          <th>유저상태</th>
          <th>생성일</th>
        </tr>
        </thead>
        <tbody>
        <c:if test="${empty userList}">
          <tr>
            <td colspan="4" class="text-center">등록된 회원이 없습니다.</td>
          </tr>
        </c:if>
        <c:forEach var="user" items="${users}">
          <tr>
            <td>${user.userId}</td>
            <td>${user.userName}</td>
            <td>${user.userStatus}</td>
            <td>${user.createdAt}</td>
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
        const memberLink = document.querySelector('a[href$="/users/list"]');
        if (memberLink) {
            memberLink.classList.add('active');
        }
    });
</script>
