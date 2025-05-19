<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="../common/header.jsp" %>
<%@ include file="../common/sidebar.jsp" %>

<div class="content-wrapper">
  <h2 class="mb-4 text-center">회원 관리</h2>

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
            <th>
              <div style="display: flex; justify-content: space-between; align-items: center;">
                <span>생성일</span>
                <div style="margin-left: 10px;">
                  <label for="statusFilter" class="visually-hidden">유저 상태</label>
                  <select id="statusFilter" class="form-select form-select-sm" style="width: 100px;">
                    <option value="">전체</option>
                    <option value="정상">정상</option>
                    <option value="휴면">휴면</option>
                    <option value="정지">정지</option>
                    <option value="탈퇴">탈퇴</option>
                  </select>
                </div>
              </div>
            </th>
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
              <td>${user.userId}</td>
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

        const filter = document.getElementById("statusFilter");
        filter.addEventListener("change", function() {
            const selected = filter.value;
            const rows = document.querySelectorAll("tbody tr");

            rows.forEach(row => {
                const statusCell = row.querySelector(".user-status");
                if (!statusCell) return;

                const status = statusCell.textContent.trim();
                const shouldShow = selected === "" || status === selected;
                row.style.display = shouldShow ? "" : "none";
            });
        });
    });
</script>
