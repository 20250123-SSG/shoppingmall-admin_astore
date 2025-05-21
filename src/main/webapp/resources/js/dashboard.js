// ── resources/js/dashboard.js ──

// contextPath 는 JSP 에서 <c:set> 으로 정의됩니다.
const contextPath = window.contextPath || '';
const yearSelect = document.getElementById('yearSelect');

// 월별 매출 차트 초기화
const ctx = document.getElementById('salesChart').getContext('2d');
const salesChart = new Chart(ctx, {
    type: 'bar',
    data: {
        labels: [],
        datasets: [{
            label: '월별 매출',
            data: [],
            backgroundColor: 'rgba(54, 162, 235, 0.6)'
        }]
    },
    options: {
        responsive: true,
        scales: {
            y: { beginAtZero: true }
        }
    }
});

// 제품 카테고리별 도넛 차트
const productCategoryCtx = document.getElementById('productCategoryChart').getContext('2d');
new Chart(productCategoryCtx, {
    type: 'doughnut',
    data: {
        labels: ['iPhone', 'iPad', 'Mac'],
        datasets: [{
            data: [45, 35, 20],
            backgroundColor: [
                'rgba(255, 99, 132, 0.8)',
                'rgba(54, 162, 235, 0.8)',
                'rgba(255, 206, 86, 0.8)'
            ]
        }]
    },
    options: {
        responsive: true,
        plugins: { legend: { position: 'bottom' } }
    }
});

// 연도 옵션 채우기
async function populateYearOptions() {
    try {
        const response = await fetch(`${contextPath}/sales/years`);
        if (!response.ok) {
            throw new Error(`HTTP error! status: ${response.status}`);
        }
        const years = await response.json();

        yearSelect.innerHTML = '';
        const currentYear = new Date().getFullYear();

        years.forEach(y => {
            const opt = document.createElement('option');
            opt.value = y;
            opt.text = y;
            if (y === currentYear) opt.selected = true;
            yearSelect.appendChild(opt);
        });

        // 초기 차트 로드
        await loadChartData(currentYear);
    } catch (error) {
        console.error('연도 데이터를 불러오는데 실패했습니다:', error);
    }
}

// 해당 연도 데이터 로드
async function loadChartData(year) {
    if (!year) {
        console.error('연도가 지정되지 않았습니다.');
        return;
    }

    try {
        const response = await fetch(`${contextPath}/sales/data?year=${year}`);
        if (!response.ok) {
            throw new Error(`HTTP error! status: ${response.status}`);
        }
        const data = await response.json();

        salesChart.data.labels = data.labels;
        salesChart.data.datasets[0].data = data.values;
        salesChart.update();
    } catch (error) {
        console.error('매출 데이터를 불러오는데 실패했습니다:', error);
    }
}

// 페이지 로드 시
document.addEventListener('DOMContentLoaded', () => {
    populateYearOptions();
    yearSelect.addEventListener('change', e => {
        const selectedYear = parseInt(e.target.value);
        if (!isNaN(selectedYear)) {
            loadChartData(selectedYear);
        }
    });
});