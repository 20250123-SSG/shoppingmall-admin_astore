<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<div class="container py-4">
    <div class="d-flex justify-content-between mb-4">
        <h2>제목 : ${post.postSubject}</h2>
        <a href="${ctx}/post/list.page?boardId=${selectedBoardId}&page=${page}"
           class="btn btn-secondary">목록</a>
    </div>

    <dl class="row">


        <dt class="col-sm-2">작성자</dt>
        <dd class="col-sm-10">${post.userName}</dd>

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
    <hr/>
    <div class="container py-4">
        <h5>댓글</h5>
        <ul id="commentList" class="list-group mb-3"></ul>

        <div class="input-group mb-3">
            <input type="text"
                   id="newCommentContent"
                   class="form-control"
                   placeholder="댓글을 입력하세요"/>
            <button id="addCommentBtn" class="btn btn-primary">등록</button>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <script>
        const ctx    = '${ctx}';
        const postId = '${post.id}';

        function loadComments() {
            $.getJSON(ctx + '/comments/post/' + postId, function(data) {
                const $list = $('#commentList').empty();
                if (data.length === 0) {
                    $list.append(
                      '<li class="list-group-item text-center text-muted">'
                      + '등록된 댓글이 없습니다.</li>'
                    );
                } else {
                    data.forEach(function(c) {
                        $list.append(
                          '<li class="list-group-item">'
                          +   '<p>' + c.commentContent + '</p>'
                          +   '<small class="text-muted">'
                          +     '작성자: ' + c.userId
                          +     '   작성일 : ' + c.createdAt
                          +   '</small>'
                          + '</li>'
                        );
                    });
                }
            });
        }

        $('#addCommentBtn').click(function(){
            const content = $('#newCommentContent').val().trim();
            if (!content) {
                alert('댓글을 입력해주세요.');
                return;
            }
            $.ajax({
                url:    ctx + '/comments',
                type:   'POST',
                contentType: 'application/json',
                data:   JSON.stringify({ postId: postId, commentContent: content }),
                success: function() {
                    $('#newCommentContent').val('');
                    loadComments();
                },
                error: function() {
                    alert('댓글 등록에 실패했습니다.');
                }
            });
        });

        $(loadComments);
    </script>
</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
