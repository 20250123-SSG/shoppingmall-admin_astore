<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp" %>

<div class="content-wrapper">
  <div class="container-fluid mt-4">
    <!-- 매출 현황 그래프 -->
    <div class="row mb-4">
      <div class="col-12">
        <div class="card">
          <div class="card-header">
            <div class="d-flex justify-content-between align-items-center">
              <h5 class="card-title mb-0">매출 현황</h5>
              <div class="d-flex gap-2 align-items-center">
                <div class="btn-group" role="group">
                  <button type="button" class="btn btn-outline-primary btn-sm active" data-period="daily">일별</button>
                  <button type="button" class="btn btn-outline-primary btn-sm" data-period="weekly">주별</button>
                  <button type="button" class="btn btn-outline-primary btn-sm" data-period="monthly">월별</button>
                  <button type="button" class="btn btn-outline-primary btn-sm" data-period="custom">기간 지정</button>
                </div>
                <div id="customDateRange" style="display: none;" class="d-flex gap-2">
                  <input type="date" class="form-control form-control-sm" id="startDate" style="width: 130px;">
                  <input type="date" class="form-control form-control-sm" id="endDate" style="width: 130px;">
                  <button class="btn btn-primary btn-sm" id="updateChart">조회</button>
                </div>
              </div>
            </div>
          </div>
          <div class="card-body">
            <canvas id="salesChart" height="100"></canvas>
          </div>
        </div>
      </div>
    </div>

    <!-- 모델별 판매 현황 -->
    <div class="row mb-4">
      <div class="col-12">
        <div class="card">
          <div class="card-header">
            <h5 class="card-title">모델별 판매 현황</h5>
          </div>
          <div class="card-body">
            <div class="table-responsive">
              <table id="modelSalesTable" class="table table-bordered">
                <thead>
                <tr>
                  <th>모델명</th>
                  <th>판매수량</th>
                  <th>판매금액</th>
                  <th>재고</th>
                </tr>
                </thead>
                <tbody>
                <!-- 더미 데이터 -->
                <tr>
                  <td>iPhone 15 Pro</td>
                  <td>150</td>
                  <td>225,000,000</td>
                  <td>50</td>
                </tr>
                <tr>
                  <td>iPhone 15</td>
                  <td>200</td>
                  <td>240,000,000</td>
                  <td>30</td>
                </tr>
                <tr>
                  <td>iPhone 14 Pro</td>
                  <td>80</td>
                  <td>104,000,000</td>
                  <td>20</td>
                </tr>
                </tbody>
              </table>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- 문의사항 -->
    <div class="row">
      <div class="col-md-6 mb-4">
        <div class="card">
          <div class="card-header">
            <h5 class="card-title">1:1 문의</h5>
          </div>
          <div class="card-body">
            <div id="inquiriesList" class="list-group">
              <!-- Ajax로 데이터 로드 -->
            </div>
          </div>
        </div>
      </div>

      <div class="col-md-6 mb-4">
        <div class="card">
          <div class="card-header">
            <h5 class="card-title">상품 문의</h5>
          </div>
          <div class="card-body">
            <div id="productInquiriesList" class="list-group">
              <!-- Ajax로 데이터 로드 -->
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<!-- Chart.js CDN -->
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<script>
  // 더미 데이터 정의
  const dummyData = {
    daily: {
      labels: ['11/1', '11/2', '11/3', '11/4', '11/5', '11/6', '11/7'],
      data: [8500000, 12000000, 9500000, 15000000, 11000000, 13500000, 10000000]
    },
    weekly: {
      labels: ['1주차', '2주차', '3주차', '4주차'],
      data: [45000000, 52000000, 48000000, 55000000]
    },
    monthly: {
      labels: ['6월', '7월', '8월', '9월', '10월', '11월'],
      data: [180000000, 195000000, 210000000, 205000000, 220000000, 235000000]
    }
  };

  document.addEventListener("DOMContentLoaded", function () {
    const ctx = document.getElementById('salesChart').getContext('2d');
    let salesChart = null;
    let activePeriodButton = document.querySelector('[data-period="daily"]');

    // 차트 초기화 함수
    function initChart(labels, data) {
      if (salesChart) {
        salesChart.destroy();
      }

      salesChart = new Chart(ctx, {
        type: 'bar',
        data: {
          labels: labels,
          datasets: [{
            label: '매출',
            data: data,
            backgroundColor: 'rgba(54, 162, 235, 0.2)',
            borderColor: 'rgba(54, 162, 235, 1)',
            borderWidth: 1
          }]
        },
        options: {
          responsive: true,
          scales: {
            y: {
              beginAtZero: true,
              ticks: {
                callback: function(value) {
                  return value.toLocaleString() + '원';
                }
              }
            }
          },
          plugins: {
            tooltip: {
              callbacks: {
                label: function(context) {
                  return context.parsed.y.toLocaleString() + '원';
                }
              }
            }
          }
        }
      });
    }

    // 기간 선택 버튼 이벤트 처리
    const periodButtons = document.querySelectorAll('[data-period]');
    const customDateRange = document.getElementById('customDateRange');
    const startDate = document.getElementById('startDate');
    const endDate = document.getElementById('endDate');
    const updateButton = document.getElementById('updateChart');

    // 오늘 날짜를 기본값으로 설정
    const today = new Date();
    endDate.value = today.toISOString().split('T')[0];
    
    // 시작일을 7일 전으로 설정
    const sevenDaysAgo = new Date(today);
    sevenDaysAgo.setDate(today.getDate() - 6);
    startDate.value = sevenDaysAgo.toISOString().split('T')[0];

    // 기간 선택 버튼 클릭 이벤트
    periodButtons.forEach(button => {
      button.addEventListener('click', function() {
        const period = this.dataset.period;
        
        // 활성 버튼 스타일 변경
        if (activePeriodButton) {
          activePeriodButton.classList.remove('btn-primary');
          activePeriodButton.classList.add('btn-outline-primary');
        }
        this.classList.remove('btn-outline-primary');
        this.classList.add('btn-primary');
        activePeriodButton = this;

        if (period === 'custom') {
          customDateRange.style.display = 'flex';
        } else {
          customDateRange.style.display = 'none';
          initChart(dummyData[period].labels, dummyData[period].data);
        }
      });
    });

    // 커스텀 기간 조회 버튼 클릭 이벤트
    updateButton.addEventListener('click', () => {
      // 커스텀 기간의 더미 데이터 생성
      const start = new Date(startDate.value);
      const end = new Date(endDate.value);
      const days = [];
      const data = [];
      
      while (start <= end) {
        days.push(start.getMonth() + 1 + '/' + start.getDate());
        data.push(Math.floor(Math.random() * 10000000) + 5000000); // 500만원 ~ 1500만원 사이 랜덤 값
        start.setDate(start.getDate() + 1);
      }
      
      initChart(days, data);
    });

    // 초기 데이터 로드 (일별 데이터)
    initChart(dummyData.daily.labels, dummyData.daily.data);
  });
</script>

</body>
</html>
