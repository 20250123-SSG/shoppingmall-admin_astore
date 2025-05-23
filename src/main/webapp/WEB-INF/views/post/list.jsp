<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>


<div class="container py-4">
  <!-- 선택된 보드 이름 찾기 -->
  <c:forEach var="b" items="${boards}">
    <c:if test="${b.id == selectedBoardId}">
      <h2 class="mb-3">감사합니다${b.boardName}</h2>
    </c:if>
  </c:forEach>

  <!-- 게시판 탭 -->
  <ul class="nav nav-tabs mb-3">
    <li class="nav-item">
      <a class="nav-link" href="${ctx}/post/list.page?boardId=1&page=1">
        공지사항
      </a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="${ctx}/post/list.page?boardId=2&page=1">
        1대1문의
      </a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="${ctx}/post/list.page?boardId=3&page=1">
        상품문의
      </a>
    </li>
  </ul>
  <!-- 검색 폼 -->
  <form class="row g-2 mb-3" method="get" action="${ctx}/post/list.page">
    <input type="hidden" name="boardId"  value="${selectedBoardId}"/>
    <input type="hidden" name="page"     value="1"/>
    <div class="col-auto">
      <input type="text" name="keyword"
             class="form-control"
             value="${keyword}"
             placeholder="제목 검색"/>
    </div>
    <div class="col-auto">
      <button type="submit" class="btn btn-secondary">검색</button>
    </div>
  </form>
  <!-- 글쓰기, 선택 삭제 -->
  <div class="d-flex justify-content-end mb-2">
    <a href="${ctx}/post/regist.page?boardId=${selectedBoardId}"
       class="btn btn-primary me-2">글쓰기</a>
    <button id="deleteBtn" class="btn btn-danger">선택 삭제</button>
  </div>

  <form id="deleteForm" action="${ctx}/post/delete" method="post">
    <input type="hidden" name="boardId" value="${selectedBoardId}"/>
    <table class="table table-hover align-middle">
      <thead>
      <tr>
        <th><input type="checkbox" id="selectAll"/></th>
        <th>번호</th><th>제목</th><th>작성자</th><th>작성일</th>
      </tr>
      </thead>
      <tbody>
      <c:if test="${empty list}">
        <tr><td colspan="5" class="text-center text-muted">
          게시글이 없습니다.
        </td></tr>
      </c:if>
      <c:forEach var="post" items="${list}">
        <tr>
          <td><input type="checkbox" name="postIds" value="${post.id}"/></td>
          <td>${post.id}</td>
          <td>
            <a href="${ctx}/post/detail.page?no=${post.id}&boardId=${boardId}&page=${page}"
               class="text-decoration-none">
                ${post.postSubject}
            </a>
          </td>
          <td>${post.userName}</td>
          <td>${post.createdAt}</td>
        </tr>
      </c:forEach>
      </tbody>
    </table>
  </form>

  <!-- 페이징 -->
  <nav>
    <ul class="pagination justify-content-center">
      <li class="page-item ${page == 1 ? 'disabled':''}">
        <a class="page-link"
           href="${ctx}/post/list.page?boardId=${boardId}&page=${page-1}">&laquo;</a>
      </li>
      <c:forEach begin="${beginPage}" end="${endPage}" var="i">
        <li class="page-item ${i == page ? 'active':''}">
          <a class="page-link"
             href="${ctx}/post/list.page?boardId=${boardId}&page=${i}">${i}</a>
        </li>
      </c:forEach>
      <li class="page-item ${page == totalPage ? 'disabled':''}">
        <a class="page-link"
           href="${ctx}/post/list.page?boardId=${boardId}&page=${page+1}">&raquo;</a>
      </li>
    </ul>
  </nav>

</div>

<script>
  // 전체 선택/해제
  document.getElementById('selectAll').addEventListener('change', function(){
    document.querySelectorAll('input[name="postIds"]')
      .forEach(cb => cb.checked = this.checked);
  });

  // 선택 삭제
  document.getElementById('deleteBtn').addEventListener('click', function(){
    // ① 체크된 박스 수 세기
    const checked = document.querySelectorAll('input[name="postIds"]:checked').length;
    if (checked === 0) {
      alert('삭제할 글을 하나 이상 선택해주세요.');
      return;
    }
    // ② 사용자 확인
    if (!confirm('선택된 글을 삭제하시겠습니까?')) {
      return;
    }
    // ③ 제출
    document.getElementById('deleteForm').submit();
  });
</script>



<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
