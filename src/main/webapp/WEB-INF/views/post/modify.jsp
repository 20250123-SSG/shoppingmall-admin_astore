<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<html>
<head>
    <title>글 수정</title>
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"/>
</head>
<body>
<div class="container py-4">

    <jsp:include page="/WEB-INF/views/common/header.jsp"/>

    <!-- 타이틀 & 뒤로가기 -->
    <div class="d-flex justify-content-between align-items-end my-4">
        <div>
            <h2>글 수정</h2>
            <small class="text-muted">기존 내용을 수정합니다.</small>
        </div>
        <a href="${ctx}/post/list.page" class="btn btn-secondary">목록으로</a>
    </div>

    <!-- 수정 폼 -->
    <form action="${ctx}/post/edit" method="post">
        <input type="hidden" name="id"       value="${post.id}"/>
        <input type="hidden" name="boardId"  value="${selectedBoardId}"/>
        <input type="hidden" name="page"     value="${page}"/>

        <!-- 제목 -->
        <div class="mb-3">
            <label class="form-label">제목</label>
            <input type="text" name="postSubject" class="form-control"
                   value="${post.postSubject}" required/>
        </div>
        <!-- 내용 -->
        <div class="mb-3">
            <label class="form-label">내용</label>
            <textarea name="postContent" class="form-control" rows="10" required>${post.postContent}</textarea>
        </div>

        <button class="btn btn-primary">수정</button>
        <button type="button" class="btn btn-outline-secondary"
                onclick="location.href='${ctx}/post/list.page?boardId=${selectedBoardId}&page=${page}'">
            취소
        </button>
    </form>

    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>

</div>
</body>
</html>