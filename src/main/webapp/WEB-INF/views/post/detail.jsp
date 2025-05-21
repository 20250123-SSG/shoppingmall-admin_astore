<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<div class="container py-4">
    <div class="d-flex justify-content-between mb-4">
        <h2>${post.postSubject}</h2>
        <a href="${ctx}/post/list.page?boardId=${selectedBoardId}&page=${page}"
           class="btn btn-secondary">목록</a>
    </div>

    <dl class="row">
        <dt class="col-sm-2">작성자</dt>
        <dd class="col-sm-10">${post.userId}</dd>

        <dt class="col-sm-2">작성일</dt>
        <dd class="col-sm-10">
            ${post.createdAt}
        </dd>

        <dt class="col-sm-2">내용</dt>
        <dd class="col-sm-10">${post.postContent}</dd>
    </dl>

    <div class="mt-3">
        <a href="${ctx}/post/modify.page?no=${post.id}&boardId=${selectedBoardId}&page=${page}"
           class="btn btn-primary me-2">수정</a>
        <form action="${ctx}/post/delete" method="post" style="display:inline">
            <input type="hidden" name="boardId" value="${selectedBoardId}"/>
            <input type="hidden" name="postIds"  value="${post.id}"/>
            <button type="submit" class="btn btn-danger"
                    onclick="return confirm('삭제하시겠습니까?');">
                삭제
            </button>
        </form>
    </div>
</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
