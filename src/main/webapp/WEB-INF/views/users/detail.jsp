<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="../common/header.jsp" %>
<%@ include file="../common/sidebar.jsp" %>

<div class="content-wrapper">
  <div class="container mt-4">
    <div class="card">
      <div class="card-header d-flex justify-content-between align-items-center">
        <h5 class="mb-0">회원 상세 정보</h5>
        <div>
          <button type="button" class="btn btn-primary btn-sm" onclick="editUser()">수정</button>
          <button type="button" class="btn btn-danger btn-sm" onclick="deleteUser()">삭제</button>
        </div>
      </div>
      <div class="card-body">
        <div class="row mb-3">
          <div class="col-md-3 fw-bold">회원 ID</div>
          <div class="col-md-9">${user.userId}</div>
        </div>
        <div class="row mb-3">
          <div class="col-md-3 fw-bold">유저 번호</div>
          <div class="col-md-9">${user.userPhone}</div>
        </div>
        <div class="row mb-3">
          <div class="col-md-3 fw-bold">유저 주소</div>
          <div class="col-md-9">${user.userAddress}</div>
        </div>
        <div class="row mb-3">
          <div class="col-md-3 fw-bold">유저 이메일</div>
          <div class="col-md-9">${user.userMail}</div>
        </div>
        <div class="row mb-3">
          <div class="col-md-3 fw-bold">유저 포인트</div>
          <div class="col-md-9">${user.userPoint}</div>
        </div>
        <div class="row mb-3">
          <div class="col-md-3 fw-bold">유저 상태</div>
          <div class="col-md-9">
            <c:choose>
              <c:when test="${user.userStatus == 1}">정상</c:when>
              <c:when test="${user.userStatus == 2}">휴면</c:when>
              <c:when test="${user.userStatus == 3}">정지</c:when>
              <c:when test="${user.userStatus == 4}">탈퇴</c:when>
              <c:otherwise>알 수 없음</c:otherwise>
            </c:choose>
          </div>
        </div>
        <div class="row mb-3">
          <div class="col-md-3 fw-bold">수정일</div>
          <div class="col-md-9">${user.modifiedAt}</div>
        </div>
      </div>
    </div>

    <!-- 목록으로 버튼 -->
    <div class="mt-3 ms-3">
      <button type="button" class="btn btn-secondary" onclick="goToList()">목록으로</button>
    </div>

<%--    <!-- 문의 내역 -->--%>
<%--    <div class="card mt-4">--%>
<%--      <div class="card-header">--%>
<%--        <h5 class="mb-0">문의 내역</h5>--%>
<%--      </div>--%>
<%--      <div class="card-body">--%>
<%--        <table class="table">--%>
<%--          <thead>--%>
<%--          <tr>--%>
<%--            <th>번호</th>--%>
<%--            <th>제목</th>--%>
<%--            <th>상태</th>--%>
<%--            <th>등록일</th>--%>
<%--          </tr>--%>
<%--          </thead>--%>
<%--          <tbody>--%>
<%--          <c:forEach var="inquiry" items="${user.inquiries}">--%>
<%--            <tr>--%>
<%--              <td>${inquiry.id}</td>--%>
<%--              <td>${inquiry.title}</td>--%>
<%--              <td>--%>
<%--                  <span class="badge--%>
<%--                    <c:choose>--%>
<%--                      <c:when test="${inquiry.status == '답변대기'}">bg-warning</c:when>--%>
<%--                      <c:when test="${inquiry.status == '답변완료'}">bg-success</c:when>--%>
<%--                      <c:otherwise>bg-secondary</c:otherwise>--%>
<%--                    </c:choose>--%>
<%--                  ">--%>
<%--                      ${inquiry.status}--%>
<%--                  </span>--%>
<%--              </td>--%>
<%--              <td>${inquiry.createdDate}</td>--%>
<%--            </tr>--%>
<%--          </c:forEach>--%>
<%--          </tbody>--%>
<%--        </table>--%>
<%--      </div>--%>
<%--    </div>--%>
<%--  </div>--%>
<%--</div>--%>

    <%@ include file="../common/footer.jsp" %>

    <c:set var="ctx" value="${pageContext.request.contextPath}" />

    <script>
        function editUser() {
            if (confirm('회원 정보를 수정하시겠습니까?')) {
                location.href = '${ctx}/users/edit?id=${user.id}';
            }
        }

        function deleteUser() {
            if (confirm('정말 이 회원을 삭제하시겠습니까?')) {
                location.href = '${ctx}/users/delete?id=${user.id}';
            }
        }

        function goToList() {
            location.href = '${ctx}/users/list';
        }

        document.addEventListener('DOMContentLoaded', function () {
            const userLink = document.querySelector('a[href="/users"]');
            if (userLink) {
                userLink.classList.add('active');
            }
        });
    </script>


    <c:if test="${param.updated eq 'true'}">
    <script>
        alert('회원 정보가 성공적으로 수정되었습니다.');
    </script>
    </c:if>
