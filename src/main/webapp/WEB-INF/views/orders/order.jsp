<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<%@ include file="../common/header.jsp" %>
<%@ include file="../common/sidebar.jsp" %>


<div class="content-wrapper">
  <div class="container-fluid">
    <h2 class="mt-4">판매 매출 조회</h2>

    <style>
      #pagination {
        display: flex;
        justify-content: center;
        flex-wrap: wrap;
        gap: 5px;
        margin-top: 20px;
      }

      .page-btn {
        padding: 5px 10px;
        cursor: pointer;
        border: 1px solid #ccc;
        border-radius: 4px;
        background-color: white;
      }

      .page-btn:hover:not(:disabled) {
        background-color: #f0f0f0;
      }

      .page-btn.active {
        font-weight: bold;
        background-color: #007bff;
        color: white;
      }

      .page-btn:disabled {
        cursor: not-allowed;
        opacity: 0.5;
      }
      .modal {
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        overflow: auto;
        z-index: 1000;
        display: flex;
        align-items: center;
        justify-content: center;
      }

      .modal-backdrop {
        z-index: -1;
      }

      #salesTable tbody tr {
        cursor: pointer; /* 마우스가 올려지면 손가락 모양 */
      }
      #salesTable tbody tr:hover {
        background-color: #f0f8ff; /* 마우스 올릴 때 배경색 변경 (선택 사항) */
      }

      #salesTable tbody tr.selected {
        background-color: #cce5ff; /* 클릭된 행 배경색 */
        color: #003366; /* 글자색도 변경 가능 */
      }

    </style>

    <script>const contextPath = '${contextPath}';</script>

    <!-- 날짜 선택 및 버튼 -->
    <div class="mb-3">
      <input type="date" id="startDate">
      <input type="date" id="endDate">
      <button onclick="searchSales()">조회</button>

      <button onclick="setPeriod(7)">1주일</button>
      <button onclick="setPeriod(30)">1개월</button>
      <button onclick="setPeriod(365)">1년</button>
      <button onclick="setPeriod(1095)">3년</button>
    </div>

    <!-- 주문 리스트 테이블 -->
    <table class="table" id="salesTable">
      <thead>

      <tr>
        <th>주문 ID</th>
        <th>회원 ID</th>
        <th>주문 금액</th>
        <th>주문일</th>
      </tr>
      </thead>
      <tbody>
      <!-- JS로 데이터 추가 -->
      </tbody>
    </table>

    <div id="pagination" class="mt-3"></div>
  </div>
  <!-- 주문 상세 모달 -->
  <div id="orderDetailModal" class="modal" style="display:none;">
    <div class="modal-content" style="max-width:600px; margin: 100px auto; padding: 20px; background:white; border-radius:8px; position: relative;">
      <span id="closeModal" style="position:absolute; top:10px; right:15px; cursor:pointer; font-size:24px;">&times;</span>
      <h4>주문 상세 정보</h4>
      <div id="modalDetailContent">
        <!-- 상세 내용 들어감 -->
      </div>
    </div>
    <div class="modal-backdrop" style="position: fixed; top:0; left:0; width:100%; height:100%; background:rgba(0,0,0,0.5);"></div>
  </div>
</div>


<script>
  function openModal() {
    document.getElementById('orderDetailModal').style.display = 'flex';
  }

  function closeModal() {
    document.getElementById('orderDetailModal').style.display = 'none';
  }

  // 닫기 버튼 클릭 이벤트 연결
  document.getElementById('closeModal').addEventListener('click', closeModal);


  window.onload = function () {
    // 날짜 입력칸 초기화 (전체 기간으로)
    document.getElementById('startDate').value = '';
    document.getElementById('endDate').value = '';

    // 전체 조회 실행
    searchSales();
  };

  <!-- 행 클릭 이벤트 -->
  function setPeriod(days) {
    const end = new Date();
    const start = new Date();
    start.setDate(end.getDate() - days);

    document.getElementById('startDate').value = start.toISOString().slice(0, 10);
    document.getElementById('endDate').value = end.toISOString().slice(0, 10);
    searchSales();
  }

  function searchSales() {
    const startDate = document.getElementById('startDate').value;
    const endDate = document.getElementById('endDate').value;

    let url = 'http://localhost:8080/sales/list'
      + '?startDate='+startDate
      + '&endDate='+endDate;

    if (startDate && endDate) {
      url += '?startDate=' + startDate + '&endDate=' + endDate;
    }
    fetch(url)
      .then(response => response.json())
      .then(data => drawSalesTable(data))
      .catch(error => console.error('매출 조회 실패:', error));
  }


  let salesData = []; // 전체 데이터를 저장할 전역 변수
  const itemsPerPage = 5; // 페이지당 항목 수

  function drawSalesTable(data) {
    salesData = data;
    renderPage(1); // 첫 페이지부터 렌더링
  }

  function renderPage(page) {
    const tbody = document.querySelector("#salesTable tbody");
    tbody.innerHTML = "";

    const startIndex = (page - 1) * itemsPerPage;
    const endIndex = startIndex + itemsPerPage;
    const pageData = salesData.slice(startIndex, endIndex);

    if (pageData.length === 0) {
      tbody.innerHTML = `<tr><td colspan="4">조회 결과가 없습니다.</td></tr>`;
      document.getElementById("pagination").innerHTML = "";
      return;
    }

    pageData.forEach(order => {
      const dateTime = new Date(order.createdAt).toLocaleString();
      const row = `
        <tr>
          <td>\${order.id}</td>
          <td>\${order.userId}</td>
          <td>\${order.orderAmount.toLocaleString()}원</td>
          <td>\${dateTime}</td>
        </tr>`;
      tbody.innerHTML += row;
    });

    bindRowClickEvents();
    drawPagination(page);
  }

  function drawPagination(currentPage) {
    const totalPages = Math.ceil(salesData.length / itemsPerPage);
    const paginationDiv = document.getElementById("pagination");
    paginationDiv.innerHTML = "";

    // << 처음으로
    const firstBtn = document.createElement("button");
    firstBtn.textContent = "처음으로";
    firstBtn.className = "page-btn";
    firstBtn.disabled = currentPage === 1;
    firstBtn.addEventListener("click", () => renderPage(1));
    paginationDiv.appendChild(firstBtn);

    // < 이전
    const prevBtn = document.createElement("button");
    prevBtn.textContent = "이전";
    prevBtn.className = "page-btn";
    prevBtn.disabled = currentPage === 1;
    prevBtn.addEventListener("click", () => renderPage(currentPage - 1));
    paginationDiv.appendChild(prevBtn);

    // 페이지 번호들
    for (let i = 1; i <= totalPages; i++) {
      const btn = document.createElement("button");
      btn.textContent = i;
      btn.className = "page-btn";
      if (i === currentPage) {
        btn.classList.add("active");
      }
      btn.addEventListener("click", () => renderPage(i));
      paginationDiv.appendChild(btn);
    }

    // > 다음
    const nextBtn = document.createElement("button");
    nextBtn.textContent = "다음";
    nextBtn.className = "page-btn";
    nextBtn.disabled = currentPage === totalPages;
    nextBtn.addEventListener("click", () => renderPage(currentPage + 1));
    paginationDiv.appendChild(nextBtn);

    // >> 마지막으로
    const lastBtn = document.createElement("button");
    lastBtn.textContent = "마지막으로";
    lastBtn.className = "page-btn";
    lastBtn.disabled = currentPage === totalPages;
    lastBtn.addEventListener("click", () => renderPage(totalPages));
    paginationDiv.appendChild(lastBtn);
  }

  function bindRowClickEvents() {
    const rows = document.querySelectorAll("#salesTable tbody tr");
    rows.forEach(row => {
      row.addEventListener('click', () => {
        const orderId = row.cells[0].textContent;
        openModal();
        fetchOrderDetail(orderId);
      });
    });
  }

  function fetchOrderDetail(orderId) {
    console.log(orderId);
    fetch(`${contextPath}/sales/detail?orderId=\${orderId}`)
      .then(response => response.json())
      .then(data => {
        let html = `<table class="table"><thead><tr><th>모델 ID</th><th>모델</th><th>수량</th><th>가격</th></tr></thead><tbody>`;

        data.forEach(detail => {
          const mo = detail.modelOption;
          console.log(mo);
          const modelInfo = `\${mo.color} / \${mo.ram} / \${mo.size}`;
          html += `
          <tr>
            <td>\${mo.id}</td>
            <td>\${modelInfo}</td>
            <td>\${detail.orderQuantity}</td>
            <td>\${detail.orderPrice.toLocaleString()}원</td>
          </tr>
        `;
        });

        html += '</tbody></table>';
        document.getElementById('modalDetailContent').innerHTML = html;
      })
      .catch(error => {
        console.error('상세 조회 실패:', error);
        document.getElementById('modalDetailContent').innerHTML = '<p>상세 정보를 불러올 수 없습니다.</p>';
      });
  }

  function drawOrderDetail(order, details) {
    let html = `
    <div style="margin-bottom: 15px;">
      <strong>주문 ID:</strong> \${order.id}<br>
      <strong>회원 ID:</strong> \${order.userId}<br>
      <strong>주문일:</strong> \${new Date(order.createdAt).toLocaleString()}<br>
      <strong>총 주문 금액:</strong> \${order.orderAmount.toLocaleString()}원
    </div>
  `;

    if (!details || details.length === 0) {
      html += '<p>주문 상세 정보가 없습니다.</p>';
    } else {
      html += `
      <table class="table">
        <thead>
          <tr>
            <th>옵션 ID</th>
            <th>수량</th>
            <th>가격</th>
          </tr>
        </thead>
        <tbody>
    `;

      details.forEach(detail => {
        html += `
        <tr>
          <td>\${detail.modelOptionId}</td>
          <td>\${detail.orderQuantity}</td>
          <td>\${detail.orderPrice.toLocaleString()}원</td>
        </tr>
      `;
      });

      html += '</tbody></table>';
    }

    document.getElementById('modalDetailContent').innerHTML = html;
  }
</script>




<%@ include file="../common/footer.jsp" %>