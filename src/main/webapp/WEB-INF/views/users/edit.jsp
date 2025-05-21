<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="../common/header.jsp" %>
<%@ include file="../common/sidebar.jsp" %>

<%-- contextPath 설정 --%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<div class="container mt-4">
  <h2>회원 정보 수정</h2>
  <form action="${ctx}/users/update" method="post">
    <input type="hidden" name="id" value="${user.id}"/>

    <div class="mb-3">
      <label class="form-label">비밀번호</label>
      <input type="text" class="form-control" name="userPwd" value="${user.userPwd}"/>
    </div>

    <div class="mb-3">
      <label class="form-label">이름</label>
      <input type="text" class="form-control" name="userName" value="${user.userName}"/>
    </div>

    <div class="mb-3">
      <label class="form-label">전화번호</label>
      <input type="text" class="form-control" name="userPhone" value="${user.userPhone}"/>
    </div>

    <div class="mb-3">
      <label class="form-label">주소</label>
      <input type="text" class="form-control" name="userAddress" value="${user.userAddress}"/>
    </div>

    <div class="mb-3">
      <label class="form-label">이메일</label>
      <input type="email" class="form-control" name="userMail" value="${user.userMail}"/>
    </div>

    <div class="mb-3">
      <label class="form-label">포인트</label>
      <input type="number" class="form-control" name="userPoint" value="${user.userPoint}"/>
    </div>

    <div class="mb-3">
      <label class="form-label">상태</label>
      <select class="form-select" name="userStatus">
        <option value="1" ${user.userStatus == 1 ? 'selected' : ''}>정상</option>
        <option value="2" ${user.userStatus == 2 ? 'selected' : ''}>휴면</option>
        <option value="3" ${user.userStatus == 3 ? 'selected' : ''}>정지</option>
        <option value="4" ${user.userStatus == 4 ? 'selected' : ''}>탈퇴</option>
      </select>
    </div>

    <button type="submit" class="btn btn-primary">저장</button>
    <a href="${ctx}/users/list" class="btn btn-secondary">취소</a>
  </form>
</div>

<%@ include file="../common/footer.jsp" %>
