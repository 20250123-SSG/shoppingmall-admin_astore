package com.aplestore.dao;

import com.aplestore.dto.OrderDTO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface OrderMapper {
    List<Integer> selectAvailableYears();

    List<OrderDTO> selectMonthlySales(@Param("year") int year);
}