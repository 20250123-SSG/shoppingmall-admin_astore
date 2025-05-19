package com.aplestore.controller;


import com.aplestore.dto.OrderDTO;
import com.aplestore.service.BoardService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Slf4j
@Controller
@RequestMapping("/sales")
public class BoardController {

    private final BoardService boardService;

    @GetMapping("/sales")
    public String sales(@RequestParam(value = "year", required = false) Integer year, Model model) {
        List<Integer> years = boardService.getAvailableYears();
        model.addAttribute("years", years);
        model.addAttribute("selectedYear", year != null ? year : (years.isEmpty() ? null : years.get(0)));
        return "sales";
    }

    public BoardController(BoardService boardService) {
        this.boardService = boardService;
    }

    @GetMapping
    public String showSalesPage(Model model) {
        List<Integer> years = boardService.getAvailableYears();
        int defaultYear = years.isEmpty() ? LocalDate.now().getYear() : years.get(0);

        model.addAttribute("years", years);
        model.addAttribute("selectedYear", defaultYear);

        return "sales"; // sales.jsp
    }

    @GetMapping("/data")
    @ResponseBody
    public Map<String, Object> getSalesData(@RequestParam int year) {
        List<OrderDTO> salesList = boardService.getMonthlySalesByYear(year);

        List<String> labels = new ArrayList<>();
        List<Integer> values = new ArrayList<>();
        for (OrderDTO o : salesList) {
            labels.add(o.getMonth() + "월");
            values.add(o.getTotalSales());
        }

        Map<String, Object> result = new HashMap<>();
        result.put("labels", labels);
        result.put("values", values);
        return result;
    }
}
