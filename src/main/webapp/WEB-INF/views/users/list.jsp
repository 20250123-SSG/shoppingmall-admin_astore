<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="../common/header.jsp" %>
<%@ include file="../common/sidebar.jsp" %>

<div class="content-wrapper">
  <h2 class="mb-4 text-center">회원 관리</h2>


  <!-- 검색 폼 추가 -->
  <form method="get" action="/main/users/search" class="row g-3 mb-3" style="width: 90%; margin: 0 auto;">
    <div class="col-md-4">
      <input type="text" name="keyword" class="form-control" placeholder="회원 ID 또는 이름 검색" value="${keyword}">
    </div>
    <div class="col-md-3">
      <select name="status" class="form-select" onchange="this.form.submit()">
        <option value="">전체 상태</option>
        <option value="1" ${status == '1' ? 'selected' : ''}>정상</option>
        <option value="2" ${status == '2' ? 'selected' : ''}>휴면</option>
        <option value="3" ${status == '3' ? 'selected' : ''}>정지</option>
        <option value="4" ${status == '4' ? 'selected' : ''}>탈퇴</option>
      </select>
    </div>
    <div class="col-md-2">
      <button type="submit" class="btn btn-primary w-100">검색</button>
    </div>
    <div class="col-md-2">
      <a href="/main/users/list" class="btn btn-secondary w-100">초기화</a>
    </div>
  </form>

  <!-- 테이블 가운데 정렬 -->
  <div style="display: flex; justify-content: center;">
    <div class="card" style="width: 90%;">
      <div class="card-body">
        <table class="table table-bordered text-center">
          <thead>
          <tr>
            <th>회원ID</th>
            <th>유저이름</th>
            <th>유저상태</th>
            <th>생성일</th>
          </tr>
          </thead>
          <tbody>
          <c:if test="${empty users}">
            <tr>
              <td colspan="4" class="text-center">등록된 회원이 없습니다.</td>
            </tr>
          </c:if>
          <c:forEach var="user" items="${users}">
            <tr>
              <td>
                <a href="/main/users/detail?id=${user.id}">${user.userId}</a>
              </td>
              <td>${user.userName}</td>
              <td class="user-status">
                <c:choose>
                  <c:when test="${user.userStatus == 1}">정상</c:when>
                  <c:when test="${user.userStatus == 2}">휴면</c:when>
                  <c:when test="${user.userStatus == 3}">정지</c:when>
                  <c:when test="${user.userStatus == 4}">탈퇴</c:when>
                  <c:otherwise>알 수 없음</c:otherwise>
                </c:choose>
              </td>
              <td>${user.createdAt}</td>
            </tr>
          </c:forEach>
          </tbody>
        </table>
      </div>
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

        // const filter = document.getElementById("statusFilter");
        // filter.addEventListener("change", function() {
        //     const selected = filter.value;
        //     const rows = document.querySelectorAll("tbody tr");
        //
        //     rows.forEach(row => {
        //         const statusCell = row.querySelector(".user-status");
        //         if (!statusCell) return;
        //
        //         const status = statusCell.textContent.trim();
        //         const shouldShow = selected === "" || status === selected;
        //         row.style.display = shouldShow ? "" : "none";
        //     });
        // });
    });
</script>

<%-- 삭제 후 알림 메시지 --%>

<c:if test="${param.deleted eq 'true'}">
  <script>
      alert('회원이 성공적으로 삭제되었습니다.');
  </script>
</c:if>