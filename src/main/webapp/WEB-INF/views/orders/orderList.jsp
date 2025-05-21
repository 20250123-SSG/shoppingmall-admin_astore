<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<table class="table table-hover">
  <thead>
  <tr>
    <th>주문번호</th>
    <th>주문아이디</th>
    <th>주문일자</th>
    <th>총 금액</th>
  </tr>
  </thead>
  <tbody>
  <c:forEach var="order" items="${orders}">
    <tr class="order-row" data-order-id="${order.orderId}">
      <td>${order.orderId}</td>
      <td>${order.customerName}</td>
      <td>${order.orderDate}</td>
      <td>${order.totalAmount}</td>
    </tr>
  </c:forEach>
  <c:if test="${empty orders}">
    <tr><td colspan="4" class="text-center">조회된 주문이 없습니다.</td></tr>
  </c:if>
  </tbody>
</table>
