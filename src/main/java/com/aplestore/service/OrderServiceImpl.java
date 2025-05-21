package com.aplestore.service;

import com.aplestore.dao.OrderMapper;
import com.aplestore.dto.OrderDTO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

@Service
@RequiredArgsConstructor
public class OrderServiceImpl implements OrderService {

    private final OrderMapper orderMapper;

    @Override
    public List<Integer> getAvailableYears() {
        return orderMapper.selectAvailableYears();
    }

    @Override
    public List<OrderDTO> getMonthlySales(int year) {
        return orderMapper.selectMonthlySales(year);
    }

    @Override
    public List<OrderDTO> getSalesByDateRange(LocalDateTime startDate, LocalDateTime endDate) {
        return orderMapper.getSalesByDateRange(startDate, endDate);
    }
}