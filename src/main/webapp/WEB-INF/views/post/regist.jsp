<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<html>
<head>
    <title>새 글 작성</title>
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"/>
</head>
<body>
<div class="container py-4">

    <!-- 헤더 포함 -->
    <jsp:include page="/WEB-INF/views/common/header.jsp"/>

    <!-- 타이틀 & 뒤로가기 버튼 -->
    <div class="d-flex justify-content-between align-items-end my-4">
        <div>
            <h2>새 글 작성</h2>
            <small class="text-muted">공지사항을 등록합니다.</small>
        </div>
        <a href="${ctx}/post/list.page" class="btn btn-secondary">목록으로</a>
    </div>

    <!-- 글쓰기 폼 -->
    <form id="writeForm" action="${ctx}/post/regist" method="post">
        <div class="mb-3">
            <label for="postSubject" class="form-label">제목</label>
            <input type="text" class="form-control"
                   id="postSubject" name="postSubject"
                   required maxlength="100"
                   placeholder="제목을 입력하세요"/>
        </div>

        <div class="mb-3">
            <label for="postContent" class="form-label">내용</label>
            <textarea class="form-control"
                      id="postContent" name="postContent"
                      rows="10" required
                      placeholder="내용을 입력하세요"></textarea>
        </div>

        <!-- 로그인한 사용자 ID를 히든으로 -->
        <input type="hidden" name="userId"
               value="${sessionScope.loginUser.userId}"/>

        <div class="d-flex">
            <button type="submit" class="btn btn-primary">등록</button>
            <button type="button"
                    class="btn btn-outline-secondary ms-2"
                    onclick="location.href='${ctx}/post/list.page';">
                취소
            </button>
        </div>
    </form>

    <!-- 푸터 포함 -->
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>

</div>
</body>
</html>
