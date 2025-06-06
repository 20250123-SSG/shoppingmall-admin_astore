<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<%@ include file="../common/header.jsp" %>
<%@ include file="../common/sidebar.jsp" %>

<!-- Chart.js CDN -->
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<div class="content-wrapper">
    <div class="container-fluid">
        <h2 class="mt-4">대시보드</h2>

        <!-- 통계 카드 -->
        <div class="row mt-4">
            <div class="col-xl-3 col-md-6">
                <div class="card bg-primary text-white mb-4">
                    <div class="card-body">
                        <h5>총 회원수</h5>
                        <h2>${totalUsers}</h2>
                    </div>
                </div>
            </div>
            <div class="col-xl-3 col-md-6">
                <div class="card bg-success text-white mb-4">
                    <div class="card-body">
                        <h5>총 주문수</h5>
                        <h2>${totalOrders}</h2>
                    </div>
                </div>
            </div>
            <div class="col-xl-3 col-md-6">
                <div class="card bg-warning text-white mb-4">
                    <div class="card-body">
                        <h5>미처리 문의</h5>
                        <h2>${pendingInquiries}</h2>
                    </div>
                </div>
            </div>
            <div class="col-xl-3 col-md-6">
                <div class="card bg-info text-white mb-4">
                    <div class="card-body">
                        <h5>등록 매장수</h5>
                        <h2>${totalStores}</h2>
                    </div>
                </div>
            </div>
        </div>

        <!-- 그래프 -->
        <div class="row mt-4">
            <!-- 월별 매출 그래프 -->
            <div class="col-xl-8">
                <div class="card mb-4">
                    <div class="card-header">
                        <i class="fas fa-chart-bar me-1"></i>
                        <h3>매출 조회</h3>
                        <form method="get" action="${contextPath}/sales" class="d-flex align-items-center">
                            <label for="yearSelect" class="me-2">연도 선택:</label>
                            <select id="yearSelect" name="year" class="form-select" style="width: auto;">
                            </select>
                        </form>
                    </div>
                    <div class="card-body">
                        <canvas id="salesChart"></canvas>
                    </div>
                </div>
            </div>
            <!-- 제품 카테고리별 판매 비율 -->
            <div class="col-xl-4">
                <div class="card mb-4">
                    <div class="card-header">
                        <i class="fas fa-chart-pie me-1"></i>
                        제품 카테고리별 판매 비율
                    </div>
                    <div class="card-body">
                        <canvas id="productCategoryChart"></canvas>
                    </div>
                </div>
            </div>
        </div>

        <!-- 최근 문의 목록 -->
        <div class="row">
            <!-- 1:1 문의 -->
            <div class="col-xl-6">
                <div class="card mb-4">
                    <div class="card-header">
                        <i class="fas fa-comments me-1"></i>
                        1:1 문의
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-bordered">
                                <thead>
                                <tr>
                                    <th>번호</th>
                                    <th>제목</th>
                                    <th>작성자</th>
                                    <th>상태</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td>3</td>
                                    <td><a href="${contextPath}/inquiries/3">배송 지연 문의</a></td>
                                    <td>홍길동</td>
                                    <td><span class="badge bg-warning">답변대기</span></td>
                                </tr>
                                <tr>
                                    <td>2</td>
                                    <td><a href="${contextPath}/inquiries/2">결제 오류</a></td>
                                    <td>김영희</td>
                                    <td><span class="badge bg-success">답변완료</span></td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td><a href="${contextPath}/inquiries/1">환불 요청</a></td>
                                    <td>이철수</td>
                                    <td><span class="badge bg-success">답변완료</span></td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <!-- 상품 문의 -->
            <div class="col-xl-6">
                <div class="card mb-4">
                    <div class="card-header">
                        <i class="fas fa-shopping-cart me-1"></i>
                        상품 문의
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-bordered">
                                <thead>
                                <tr>
                                    <th>번호</th>
                                    <th>제목</th>
                                    <th>상품</th>
                                    <th>상태</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td>3</td>
                                    <td><a href="${contextPath}/product-inquiries/3">아이폰15 재고 문의</a></td>
                                    <td>iPhone 15 Pro</td>
                                    <td><span class="badge bg-warning">답변대기</span></td>
                                </tr>
                                <tr>
                                    <td>2</td>
                                    <td><a href="${contextPath}/product-inquiries/2">맥북 사양 문의</a></td>
                                    <td>MacBook Pro</td>
                                    <td><span class="badge bg-success">답변완료</span></td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td><a href="${contextPath}/product-inquiries/1">애플워치 호환 문의</a></td>
                                    <td>Apple Watch</td>
                                    <td><span class="badge bg-success">답변완료</span></td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<%@ include file="../common/footer.jsp" %>


<!-- 분리된 JS 로드 -->
<script src="${contextPath}/resources/js/dashboard.js"></script>



