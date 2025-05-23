<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="../common/header.jsp" %>
<%@ include file="../common/sidebar.jsp" %>

<div class="content-wrapper">
  <h2 class="mb-4 text-center">회원 관리</h2>

  <!-- 검색 폼 -->
  <form method="get" action="/users/search" class="row g-3 mb-3" style="width: 90%; margin: 0 auto;">
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
      <a href="/users/list" class="btn btn-secondary w-100">초기화</a>
    </div>
  </form>


  <style>
    .user-link {
      color: var(--user-color, #333);
      text-decoration: none;
      font-weight: 500;
      position: relative;
      transition: all 0.2s ease;
    }

    .user-link::after {
      content: '';
      position: absolute;
      left: 0;
      bottom: -2px;
      width: 0%;
      height: 2px;
      background-color: var(--user-color, #3b82f6);
      transition: width 0.3s ease;
    }

    .user-link:hover {
      color: var(--user-color, #3b82f6);
    }

    .user-link:hover::after {
      width: 100%;
    }

    .status-label {
      color: var(--status-color);
      font-weight: 500;
      font-size: 0.95rem;
      display: inline-block;
    }
  </style>

  <!-- 상태 색상 설명 -->
  <div class="mb-3" style="width: 90%; margin: 0 auto;">
    <div style="display: flex; gap: 12px; flex-wrap: wrap;">
      <div class="status-label" style="--status-color: #22c55e;">● 정상</div>
      <div class="status-label" style="--status-color: #9ca3af;">● 휴면</div>
      <div class="status-label" style="--status-color: #ef4444;">● 정지</div>
      <div class="status-label" style="--status-color: #8b5cf6;">● 탈퇴</div>
    </div>
  </div>

  <div style="display: flex; justify-content: center;">
    <div class="card" style="width: 90%;">
      <div class="card-body">
        <table class="table table-bordered text-center">
          <thead>
          <tr>
            <th>회원ID</th>
            <th>유저이름</th>
            <th>유저상태</th>
            <th>가입일</th>
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
              <!-- 회원ID -->
              <td>
                <c:choose>
                  <c:when test="${user.userStatus == 1}">
                    <a href="/users/detail?id=${user.id}" class="user-link"
                       style="--user-color: #22c55e;">${user.userId}</a>
                  </c:when>
                  <c:when test="${user.userStatus == 2}">
                    <a href="/users/detail?id=${user.id}" class="user-link"
                       style="--user-color: #9ca3af;">${user.userId}</a>
                  </c:when>
                  <c:when test="${user.userStatus == 3}">
                    <a href="/users/detail?id=${user.id}" class="user-link"
                       style="--user-color: #ef4444;">${user.userId}</a>
                  </c:when>
                  <c:when test="${user.userStatus == 4}">
                    <a href="/users/detail?id=${user.id}" class="user-link"
                       style="--user-color: #8b5cf6;">${user.userId}</a>
                  </c:when>
                  <c:otherwise>
                    <a href="/users/detail?id=${user.id}" class="user-link">${user.userId}</a>
                  </c:otherwise>
                </c:choose>
              </td>

              <!-- 유저이름 -->
              <td>
                <c:choose>
                  <c:when test="${user.userStatus == 1}">
                    <a href="/users/detail?id=${user.id}" class="user-link"
                       style="--user-color: #22c55e;">${user.userName}</a>
                  </c:when>
                  <c:when test="${user.userStatus == 2}">
                    <a href="/users/detail?id=${user.id}" class="user-link"
                       style="--user-color: #9ca3af;">${user.userName}</a>
                  </c:when>
                  <c:when test="${user.userStatus == 3}">
                    <a href="/users/detail?id=${user.id}" class="user-link"
                       style="--user-color: #ef4444;">${user.userName}</a>
                  </c:when>
                  <c:when test="${user.userStatus == 4}">
                    <a href="/users/detail?id=${user.id}" class="user-link"
                       style="--user-color: #8b5cf6;">${user.userName}</a>
                  </c:when>
                  <c:otherwise>
                    <a href="/users/detail?id=${user.id}" class="user-link">${user.userName}</a>
                  </c:otherwise>
                </c:choose>
              </td>

              <!-- 상태 -->
              <td>
                <c:choose>
                  <c:when test="${user.userStatus == 1}">
                    <span style="color: #22c55e; font-weight: 500;">정상</span>
                  </c:when>
                  <c:when test="${user.userStatus == 2}">
                    <span style="color: #9ca3af; font-weight: 500;">휴면</span>
                  </c:when>
                  <c:when test="${user.userStatus == 3}">
                    <span style="color: #ef4444; font-weight: 500;">정지</span>
                  </c:when>
                  <c:when test="${user.userStatus == 4}">
                    <span style="color: #8b5cf6; font-weight: 500;">탈퇴</span>
                  </c:when>
                  <c:otherwise>
                    <span style="color: #000;">알 수 없음</span>
                  </c:otherwise>
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
  document.addEventListener('DOMContentLoaded', function () {
    const memberLink = document.querySelector('a[href$="/users/list"]');
    if (memberLink) {
      memberLink.classList.add('active');
    }
  });
</script>

<%--삭제 후 알림 메세지--%>

<c:if test="${param.deleted eq 'true'}">
  <script>alert('회원이 성공적으로 삭제되었습니다.');</script>
</c:if>
