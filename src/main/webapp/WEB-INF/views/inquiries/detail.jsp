<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="../common/header.jsp" %>
<%@ include file="../common/sidebar.jsp" %>

<div class="content-wrapper">
    <div class="container-fluid mt-4">
        <div class="card">
            <div class="card-header">
                <div class="d-flex justify-content-between align-items-center">
                    <h5 class="card-title mb-0">문의내역 상세</h5>
                    <div>
                        <button type="button" class="btn btn-secondary" onclick="history.back()">목록</button>
                    </div>
                </div>
            </div>
            <div class="card-body">
                <div class="inquiry-detail">
                    <div class="inquiry-header">
                        <h4>아이폰 15 Pro 재고 문의</h4>
                        <div class="inquiry-info">
                            <span>작성자: 홍길동</span>
                            <span>작성일: 2024-05-13 14:30</span>
                            <span class="badge bg-warning">처리중</span>
                        </div>
                    </div>
                    <hr>
                    <div class="inquiry-content">
                        안녕하세요,
                        
                        아이폰 15 Pro 256GB 자색 모델의 재고 문의드립니다.
                        언제쯤 입고될 예정인가요?
                        
                        빠른 답변 부탁드립니다.
                    </div>
                    <div class="model-info mt-3">
                        <h6>관련 모델 정보</h6>
                        <p>모델명: iPhone 15 Pro 256GB 자색</p>
                    </div>
                    <hr>
                    <div class="d-flex justify-content-end gap-2">
                        <button type="button" class="btn btn-primary" onclick="location.href='/inquiries/1/edit'">수정</button>
                        <button type="button" class="btn btn-danger" onclick="deleteInquiry(1)">삭제</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<%@ include file="../common/footer.jsp" %>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/inquiries.css">
<script src="${pageContext.request.contextPath}/resources/js/inquiries.js"></script>

</body>
</html> 