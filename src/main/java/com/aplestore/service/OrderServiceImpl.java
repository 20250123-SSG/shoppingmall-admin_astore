package com.aplestore.service;

import com.aplestore.common.PageUtil;
import com.aplestore.dao.OrderMapper;
import com.aplestore.dto.OrderDTO;
import com.aplestore.dto.OrderDetailDTO;
import lombok.RequiredArgsConstructor;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class OrderServiceImpl implements OrderService {

    private final OrderMapper orderMapper;
    private final SqlSessionTemplate sqlSession;
    private final PageUtil pageUtil;

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

    @Override
    public List<OrderDTO> getAllOrders() {
        return orderMapper.selectAllOrders();
    }

    @Override
    public List<OrderDTO> getOrdersByPeriod(String startDate, String endDate) {
        return orderMapper.selectOrdersByPeriod(startDate, endDate);
    }

    @Override
    public List<OrderDetailDTO> getOrderDetailsByOrderId(int orderId) {
        return orderMapper.findOrderDetailsByOrderId(orderId);
    }

    @Override
    public OrderDTO getOrderById(int orderId) {
        return orderMapper.getOrderById(orderId);
    }


}