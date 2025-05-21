<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<div class="container py-4">
    <div class="d-flex justify-content-between mb-4">
        <h2>새 글 작성</h2>
        <a href="${ctx}/post/list.page?boardId=${selectedBoardId}&page=${page}"
           class="btn btn-secondary">목록으로</a>
    </div>

    <form action="${ctx}/post/regist" method="post">
        <input type="hidden" name="boardId" value="${selectedBoardId}"/>

        <div class="mb-3">
            <label class="form-label">제목</label>
            <input type="text" name="postSubject" class="form-control" required/>
        </div>
        <div class="mb-3">
            <label class="form-label">내용</label>
            <textarea name="postContent" class="form-control" rows="10" required></textarea>
        </div>
        <button class="btn btn-primary">등록</button>
    </form>
</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
