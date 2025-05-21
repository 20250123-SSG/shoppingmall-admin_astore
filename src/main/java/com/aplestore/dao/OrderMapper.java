package com.aplestore.dao;

import com.aplestore.dto.OrderDTO;
import com.aplestore.dto.OrderDetailDTO;
import org.apache.ibatis.annotations.Param;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;

public interface OrderMapper {
    List<Integer> selectAvailableYears();

    List<OrderDTO> selectMonthlySales(@Param("year") int year);

    List<OrderDTO> getSalesByDateRange(@Param("startDate") LocalDateTime startDate, @Param("endDate") LocalDateTime endDate);

    List<OrderDTO> selectAllOrders();
    List<OrderDTO> selectOrdersByPeriod(@Param("startDate") String startDate,
                                        @Param("endDate") String endDate);

    OrderDTO selectOrderById(int orderId);
    List<OrderDetailDTO> selectOrderDetailsByOrderId(int orderId);


    List<OrderDetailDTO> findOrderDetailsByOrderId(int orderId);
}