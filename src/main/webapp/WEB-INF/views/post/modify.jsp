<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
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
    <form id="editForm" action="${ctx}/post/edit" method="post">
        <!-- 수정 대상 ID -->
        <input type="hidden" name="id" value="${post.id}"/>

        <div class="mb-3">
            <label for="postSubject" class="form-label">제목</label>
            <input type="text" class="form-control"
                   id="postSubject" name="postSubject"
                   required maxlength="100"
                   value="${post.postSubject}"/>
        </div>

        <div class="mb-3">
            <label for="postContent" class="form-label">내용</label>
            <textarea class="form-control"
                      id="postContent" name="postContent"
                      rows="10" required>${post.postContent}</textarea>
        </div>

        <!-- userId, postStatus 등은 hidden 으로 그대로 전달 -->
        <input type="hidden" name="userId"    value="${post.userId}"/>
        <input type="hidden" name="postStatus" value="${post.postStatus}"/>

        <div class="d-flex">
            <button type="submit" class="btn btn-primary">수정</button>
            <button type="button" class="btn btn-outline-secondary ms-2"
                    onclick="location.href='${ctx}/post/list.page';">
                취소
            </button>
        </div>
    </form>

    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>

</div>
</body>
</html>