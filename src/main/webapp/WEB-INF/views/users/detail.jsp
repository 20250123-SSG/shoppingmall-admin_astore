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
          <div class="col-md-9">user1</div>
        </div>
        <div class="row mb-3">
          <div class="col-md-3 fw-bold">이름</div>
          <div class="col-md-9">김철수</div>
        </div>
        <div class="row mb-3">
          <div class="col-md-3 fw-bold">이메일</div>
          <div class="col-md-9">kim@test.com</div>
        </div>
        <div class="row mb-3">
          <div class="col-md-3 fw-bold">포인트</div>
          <div class="col-md-9">1,000</div>
        </div>
        <div class="row mb-3">
          <div class="col-md-3 fw-bold">상태</div>
          <div class="col-md-9">
            <span class="badge bg-success">정상</span>
          </div>
        </div>
      </div>
    </div>

    <!-- 문의 내역 -->
    <div class="card mt-4">
      <div class="card-header">
        <h5 class="mb-0">문의 내역</h5>
      </div>
      <div class="card-body">
        <table class="table">
          <thead>
            <tr>
              <th>번호</th>
              <th>제목</th>
              <th>상태</th>
              <th>등록일</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>1</td>
              <td>배송문의</td>
              <td><span class="badge bg-warning">답변대기</span></td>
              <td>2024-03-20</td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>
  </div>
</div>

<%@ include file="../common/footer.jsp" %>

<script>
function editUser() {
  if(confirm('회원 정보를 수정하시겠습니까?')) {
    // 수정 페이지로 이동
    location.href = '/users/edit/user1';
  }
}

function deleteUser() {
  if(confirm('정말 이 회원을 삭제하시겠습니까?')) {
    // 삭제 처리
    alert('삭제되었습니다.');
    location.href = '/users';
  }
}

document.addEventListener('DOMContentLoaded', function() {
  const userLink = document.querySelector('a[href="/users"]');
  if (userLink) {
    userLink.classList.add('active');
  }
});
</script> 