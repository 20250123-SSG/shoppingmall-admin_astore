package com.aplestore.dao;

import com.aplestore.dto.OrderDTO;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface BoardMapper {
    List<Integer> selectAvailableYears();
    List<OrderDTO> selectMonthlySales(@Param("year") int year);
}
