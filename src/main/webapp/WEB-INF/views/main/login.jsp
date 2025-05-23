<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Apple Store Admin - Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/login.css" rel="stylesheet">
</head>
<body>
    <div class="login-container">
        <form id="loginForm">
            <div class="mb-3">
                <input type="text" class="form-control" id="userid" name="userid" placeholder="아이디" required>
            </div>
            <div class="mb-3">
                <input type="password" class="form-control" id="userpwd" name="userpwd" placeholder="비밀번호" required>
            </div>
            <button type="submit" class="btn btn-login">로그인</button>
            <div id="loading" class="loading">
                <div class="loading-spinner"></div>
            </div>
            <div id="error-message" class="error-message" style="display: none;"></div>
        </form>
    </div>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/login.js"></script>
</body>
</html>