package com.aplestore.service;

import com.aplestore.dto.OrderDTO;

import java.util.List;
import java.util.Map;

public interface BoardService {
    List<Integer> getAvailableYears();
    List<OrderDTO> getMonthlySalesByYear(int year);
}
