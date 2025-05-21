<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<%@ include file="../common/header.jsp" %>
<%@ include file="../common/sidebar.jsp" %>

<div class="content-wrapper">
  <div class="container-fluid">
    <h2 class="mt-4">판매 매출 조회</h2>

    <script>const contextPath = '${contextPath}';</script>

    <!-- 날짜 선택 및 버튼 -->
    <div class="mb-3">
      <input type="date" id="startDate">
      <input type="date" id="endDate">
      <button onclick="searchSales()">조회</button>

      <button onclick="setPeriod(7)">1주일</button>
      <button onclick="setPeriod(30)">1개월</button>
      <button onclick="setPeriod(365)">1년</button>
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

<!-- 행 클릭 이벤트 -->
<script>
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

    if (!startDate || !endDate) {
      alert("시작일과 종료일을 입력해주세요.");
      return;
    }

    const url = 'http://localhost:8080/sales/list'
      + '?startDate='+startDate
      + '&endDate='+endDate;

    fetch(url)
      .then(response => response.json())
      .then(data => drawSalesTable(data))
      .catch(error => console.error('매출 조회 실패:', error));
  }

  function drawSalesTable(data) {
    const tbody = document.querySelector("#salesTable tbody");
    tbody.innerHTML = "";

    if (data.length === 0) {
      tbody.innerHTML = `<tr><td colspan="4">조회 결과가 없습니다.</td></tr>`;
      return;
    }

    data.forEach(order => {
      const dateTime = new Date(order.createdAt).toLocaleString(); // 날짜시간 표시
      const row =`
            <tr>
                <td>\${order.id}</td>
                <td>\${order.userId}</td>
                <td>\${order.orderAmount.toLocaleString()}원</td>
                <td>\${dateTime}</td>
            </tr>`;
      tbody.innerHTML += row;
    });
  }
</script>


<%@ include file="../common/footer.jsp" %>