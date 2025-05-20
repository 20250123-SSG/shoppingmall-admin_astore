<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>Title</title>
    <style>
        #reply_area tbody>tr>th:nth-child(1){width:120px}
    </style>
</head>
<body>
<div class="container p-3">

    <!-- Header, Nav start -->
    <jsp:include page="/WEB-INF/views/common/header.jsp"/>
    <!-- Header, Nav end -->

    <!-- Section start -->
    <section class="row m-3" style="min-height: 500px">

        <div class="container border p-5 m-4 rounded">
            <h2 class="m-4">게시글 상세</h2>
            <br>
            <button onclick="location.href='${contextPath}/post/modify.page?no=${post.id}';">수정</button>
            <a class="btn btn-secondary" style="float:right" href="${contextPath}/post/list.page">목록으로</a>
            <br><br>

            <table align="center" class="table">
                <tr>
                    <th width="120">제목</th>
                    <td colspan="3" ><p>${post.postSubject}</p></td>
                </tr>
                <tr>
                    <th>작성자</th>
                    <td width="400">${post.userId}</td>
                    <th width="120">작성일</th>
                    <td>${post.createdAt}</td>
                </tr>

                <tr>
                    <th>내용</th>
                    <td colspan="3"></td>
                </tr>
                <tr>
                    <td colspan="4"><p style="height:150px">${post.postContent}</p></td>
                </tr>
            </table>
            <br>


            <table id="reply_area" class="table" align="center">
                <thead>
                <tr>
                    <th colspan="2" width="650">
                        <textarea class="form-control" id="reply_content" rows="2" style="resize:none; width:100%"></textarea>
                    </th>
                    <th style="vertical-align: middle"><button class="btn btn-secondary" id="reply_submit">등록하기</button></th>
                </tr>
                <tr>
                    <td colspan="3">댓글 (<span id="rcount">3</span>) </td>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <th>user02</th>
                    <td>댓글입니다.너무웃기다앙</td>
                    <td>2020-04-10</td>
                </tr>
                <tr>
                    <th>user01</th>
                    <td>많이봐주세용</td>
                    <td>2020-04-08</td>
                </tr>
                <tr>
                    <th>admin</th>
                    <td>댓글입니다ㅋㅋㅋ</td>
                    <td>2020-04-02</td>
                </tr>
                </tbody>
            </table>

        </div>

    </section>
    <!-- Section end -->

    <!-- Footer start -->
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
    <!-- Footer end -->

</div>
</body>
</html>