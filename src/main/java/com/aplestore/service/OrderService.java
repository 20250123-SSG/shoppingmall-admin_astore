package com.aplestore.service;

import com.aplestore.dto.OrderDTO;

import java.time.LocalDateTime;
import java.util.List;

public interface OrderService {
    List<Integer> getAvailableYears();
    List<OrderDTO> getMonthlySales(int year);

    List<OrderDTO> getSalesByDateRange(LocalDateTime startDate, LocalDateTime endDate);
}