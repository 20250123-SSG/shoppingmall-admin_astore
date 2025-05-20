package com.aplestore.service;

import com.aplestore.dto.OrderDTO;

import java.util.List;

public interface OrderService {
    List<Integer> getAvailableYears();
    List<OrderDTO> getMonthlySales(int year);
}