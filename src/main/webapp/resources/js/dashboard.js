document.addEventListener("DOMContentLoaded", function () {
    const ctx = document.getElementById('salesChart').getContext('2d');
    let salesChart = null;

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

    // 기간 선택 UI 이벤트 처리
    const salesPeriod = document.getElementById('salesPeriod');
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

    // 기간 선택 변경 이벤트
    salesPeriod.addEventListener('change', function() {
        if (this.value === 'custom') {
            customDateRange.style.display = 'block';
        } else {
            customDateRange.style.display = 'none';

            const today = new Date();
            const end = today.toISOString().split('T')[0];
            let start;

            switch(this.value) {
                case 'daily':
                    start = new Date(today);
                    start.setDate(today.getDate() - 6);
                    break;
                case 'weekly':
                    start = new Date(today);
                    start.setDate(today.getDate() - 28);
                    break;
                case 'monthly':
                    start = new Date(today);
                    start.setMonth(today.getMonth() - 6);
                    break;
            }

            startDate.value = start.toISOString().split('T')[0];
            endDate.value = end;

            updateChart();
        }
    });

    // 차트 업데이트 함수
    function updateChart() {
        const period = salesPeriod.value;
        const start = startDate.value;
        const end = endDate.value;

        fetch(`/admin/api/sales?period=${period}&startDate=${start}&endDate=${end}`)
          .then(response => response.json())
          .then(data => {
              initChart(data.labels, data.data);
          })
          .catch(error => {
              console.error('Error fetching sales data:', error);
              alert('매출 데이터를 불러오는 중 오류가 발생했습니다.');
          });
    }

    // 업데이트 버튼 클릭 이벤트
    updateButton.addEventListener('click', updateChart);

    // 모델별 판매 현황 데이터 로드
    function loadModelSales() {
        fetch('/admin/api/model-sales')
          .then(response => response.json())
          .then(data => {
              const tbody = document.querySelector('#modelSalesTable tbody');
              tbody.innerHTML = data.map(sale => `
                    <tr>
                        <td>${sale.modelName}</td>
                        <td>${sale.quantity.toLocaleString()}</td>
                        <td>${sale.amount.toLocaleString()}원</td>
                        <td>${sale.stock.toLocaleString()}</td>
                    </tr>
                `).join('');
          })
          .catch(error => {
              console.error('Error fetching model sales:', error);
          });
    }

    // 문의사항 데이터 로드
    function loadInquiries() {
        Promise.all([
            fetch('/admin/api/inquiries').then(res => res.json()),
            fetch('/admin/api/product-inquiries').then(res => res.json())
        ]).then(([inquiries, productInquiries]) => {
            document.getElementById('inquiriesList').innerHTML = inquiries.map(inquiry => `
                <a href="/admin/inquiry/${inquiry.id}" class="list-group-item list-group-item-action">
                    <div class="d-flex w-100 justify-content-between">
                        <h6 class="mb-1">${inquiry.title}</h6>
                        <small>${inquiry.createDate}</small>
                    </div>
                    <small class="text-muted">${inquiry.customerName}</small>
                </a>
            `).join('');

            document.getElementById('productInquiriesList').innerHTML = productInquiries.map(inquiry => `
                <a href="/admin/product-inquiry/${inquiry.id}" class="list-group-item list-group-item-action">
                    <div class="d-flex w-100 justify-content-between">
                        <h6 class="mb-1">${inquiry.title}</h6>
                        <small>${inquiry.createDate}</small>
                    </div>
                    <small class="text-muted">${inquiry.productName}</small>
                </a>
            `).join('');
        }).catch(error => {
            console.error('Error fetching inquiries:', error);
        });
    }

    // 초기 데이터 로드
    updateChart();
    loadModelSales();
    loadInquiries();
});
