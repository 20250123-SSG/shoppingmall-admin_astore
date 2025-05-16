<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<%@ include file="../common/header.jsp" %>
<%@ include file="../common/sidebar.jsp" %>

<link rel="stylesheet" href="${contextPath}/resources/css/main/dashboard.css">
<!-- Chart.js -->
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
                        월별 매출
                    </div>
                    <div class="card-body">
                        <canvas id="monthlySalesChart"></canvas>
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

<script>
// 월별 매출 차트
const monthlySalesCtx = document.getElementById('monthlySalesChart');
new Chart(monthlySalesCtx, {
    type: 'bar',
    data: {
        labels: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
        datasets: [{
            label: '매출(백만원)',
            data: [150, 190, 210, 180, 230, 250, 270, 240, 280, 260, 290, 310],
            backgroundColor: 'rgba(54, 162, 235, 0.5)',
            borderColor: 'rgb(54, 162, 235)',
            borderWidth: 1
        }]
    },
    options: {
        responsive: true,
        scales: {
            y: {
                beginAtZero: true
            }
        }
    }
});

// 제품 카테고리별 판매 비율 차트
const productCategoryCtx = document.getElementById('productCategoryChart');
new Chart(productCategoryCtx, {
    type: 'doughnut',
    data: {
        labels: ['iPhone', 'iPad', 'Mac', 'Watch', 'AirPods'],
        datasets: [{
            data: [45, 20, 15, 12, 8],
            backgroundColor: [
                'rgba(255, 99, 132, 0.8)',
                'rgba(54, 162, 235, 0.8)',
                'rgba(255, 206, 86, 0.8)',
                'rgba(75, 192, 192, 0.8)',
                'rgba(153, 102, 255, 0.8)'
            ]
        }]
    },
    options: {
        responsive: true,
        plugins: {
            legend: {
                position: 'bottom'
            }
        }
    }
});
</script>

<script src="${contextPath}/resources/js/main/dashboard.js"></script>
