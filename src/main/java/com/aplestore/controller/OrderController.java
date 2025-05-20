package com.aplestore.controller;

import com.aplestore.dto.OrderDTO;
import com.aplestore.service.OrderService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@Slf4j
@Controller
@RequestMapping("/sales")
@RequiredArgsConstructor
public class OrderController {

    private final OrderService orderService;

    @GetMapping("/dashboard")
    public String showDashboard(Model model) {
        int currentYear = java.time.LocalDate.now().getYear();
        model.addAttribute("currentYear", currentYear);
        return "main/dashboard";
    }

    @GetMapping("/years")
    @ResponseBody
    public ResponseEntity<List<Integer>> getAvailableYears() {
        List<Integer> years = orderService.getAvailableYears();
        return ResponseEntity.ok(years);
    }

    @GetMapping("/data")
    @ResponseBody
    public ResponseEntity<Map<String, Object>> getMonthlySales(@RequestParam int year) {
        List<OrderDTO> monthlyData = orderService.getMonthlySales(year);
        Map<String, Object> response = Map.of(
                "labels", monthlyData.stream().map(OrderDTO::getMonth).toList(),
                "values", monthlyData.stream().map(OrderDTO::getTotalSales).toList()
        );
        return ResponseEntity.ok(response);
    }
}