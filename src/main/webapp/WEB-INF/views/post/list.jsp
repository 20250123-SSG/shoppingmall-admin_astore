<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<html>
<head>
  <title>공지사항</title>
  <link rel="stylesheet"
        href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"/>
  <script>
    document.addEventListener('DOMContentLoaded', function() {
      const selectAll = document.getElementById('selectAll');
      const deleteBtn = document.getElementById('deleteBtn');
      const form = document.getElementById('deleteForm');

      // 전체 선택/해제
      selectAll.addEventListener('change', function() {
        document.querySelectorAll('input[name="postIds"]').forEach(cb => {
          cb.checked = selectAll.checked;
        });
      });

      // 삭제 버튼 클릭
      deleteBtn.addEventListener('click', function() {
        const checked = Array.from(document.querySelectorAll('input[name="postIds"]:checked'));
        if (!checked.length) {
          alert('삭제할 항목을 하나 이상 선택해주세요.');
          return;
        }
        if (confirm('선택된 항목을 정말 삭제하시겠습니까?')) {
          form.submit();
        }
      });
    });
  </script>
</head>
<body>
<div class="container py-4">

  <jsp:include page="/WEB-INF/views/common/header.jsp"/>

  <div class="d-flex justify-content-between align-items-end my-4">
    <div>
      <h2>공지사항</h2>
      <small class="text-muted">공지사항입니다.</small>
    </div>
    <a href="${ctx}/post/regist.page" class="btn btn-primary">등록</a>
  </div>

  <!-- 삭제 폼 시작: id 추가 -->
  <form id="deleteForm" action="${ctx}/post/delete" method="post">
    <div class="mb-2">
      <!-- 선택 삭제 버튼 -->
      <button type="button" id="deleteBtn" class="btn btn-danger">선택 삭제</button>
    </div>

    <table id="postList" class="table table-hover">
      <thead>
      <tr>
        <!-- 전체선택 체크박스 추가 -->
        <th style="width: 40px;">
          <input type="checkbox" id="selectAll"/>
        </th>
        <th width="100px">번호</th>
        <th width="400px">제목</th>
        <th width="120px">작성자</th>
        <th>작성일</th>
      </tr>
      </thead>
      <tbody>
      <c:forEach var="post" items="${list}">
        <tr>
          <!-- 삭제용 체크박스 name="deleteIds" 유지 -->
          <td>
            <input type="checkbox" name="postIds" value="${post.id}"/>
          </td>
          <td onclick="location.href='${ctx}/post/detail.page?no=${post.id}';">${post.id}</td>
          <td onclick="location.href='${ctx}/post/detail.page?no=${post.id}';">${post.postSubject}</td>
          <td onclick="location.href='${ctx}/post/detail.page?no=${post.id}';">${post.userId}</td>
          <td onclick="location.href='${ctx}/post/detail.page?no=${post.id}';">${post.createdAt}</td>
        </tr>
      </c:forEach>
      </tbody>
    </table>
  </form>
  <!-- 삭제 폼 끝 -->

  <form action="${ctx}/post/list.page" method="get"
        class="d-flex justify-content-center my-4">
    <select class="form-select w-auto me-2" name="type">
      <option value="subject" ${param.type=='subject'?'selected':''}>제목</option>
      <option value="writer"  ${param.type=='writer'?'selected':''}>작성자</option>
    </select>
    <input type="text" name="keyword" class="form-control w-50 me-2"
           value="${param.keyword}" placeholder="검색어를 입력하세요"/>
    <button type="submit" class="btn btn-secondary">검색</button>
  </form>

  <nav>
    <ul id="paging_area" class="pagination d-flex justify-content-center">
      <li class="page-item ${page == 1 ? 'disabled' : ''}">
        <a class="page-link" href="${ctx}/post/list.page?page=${page-1}"><</a>
      </li>
      <c:forEach var="p" begin="${beginPage}" end="${endPage}">
        <li class="page-item ${p == page ? 'active' : ''}">
          <a class="page-link" href="${ctx}/post/list.page?page=${p}">${p}</a>
        </li>
      </c:forEach>
      <li class="page-item ${page == totalPage ? 'disabled' : ''}">
        <a class="page-link" href="${ctx}/post/list.page?page=${page+1}">></a>
      </li>
    </ul>
  </nav>

  <jsp:include page="/WEB-INF/views/common/footer.jsp"/>

</div>
</body>
</html>
