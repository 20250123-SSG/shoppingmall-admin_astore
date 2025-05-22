package com.aplestore.service;

import com.aplestore.dto.OrderDTO;
import com.aplestore.dto.OrderDetailDTO;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;

public interface OrderService {
    List<Integer> getAvailableYears();
    List<OrderDTO> getMonthlySales(int year);

    List<OrderDTO> getSalesByDateRange(LocalDateTime startDate, LocalDateTime endDate);

    List<OrderDTO> getAllOrders();

    List<OrderDTO> getOrdersByPeriod(String startDate, String endDate);

    List<OrderDetailDTO> getOrderDetailsByOrderId(int orderId);

    OrderDTO getOrderById(int orderId);


}