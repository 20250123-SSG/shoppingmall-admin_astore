package com.aplestore.service;

import com.aplestore.dao.BoardMapper;
import com.aplestore.dto.OrderDTO;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class BoardServiceImpl implements BoardService {

    private final BoardMapper boardMapper;

    public BoardServiceImpl(BoardMapper boardMapper) {
        this.boardMapper = boardMapper;
    }

    @Override
    public List<Integer> getAvailableYears() {
        return boardMapper.selectAvailableYears();
    }

    @Override
    public List<OrderDTO> getMonthlySalesByYear(int year) {
        List<OrderDTO> dbSales = boardMapper.selectMonthlySales(year);

        Map<Integer, Integer> monthToSales = new HashMap<>();
        for (OrderDTO m : dbSales) {
            monthToSales.put(m.getMonth(), m.getTotalSales());
        }

        List<OrderDTO> fullSales = new ArrayList<>();
        for (int month = 1; month <= 12; month++) {
            OrderDTO m = new OrderDTO();
            m.setMonth(month);
            m.setTotalSales(monthToSales.getOrDefault(month, 0));
            fullSales.add(m);
        }

        return fullSales;
    }
}
