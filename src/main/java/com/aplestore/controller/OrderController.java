package com.aplestore.controller;

import com.aplestore.dto.OrderDTO;
import com.aplestore.dto.OrderDetailDTO;
import com.aplestore.service.OrderService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Slf4j
@Controller
@RequestMapping("/sales")
@RequiredArgsConstructor
public class OrderController {

    private final OrderService orderService;

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

    @GetMapping("/order")
    public String Order(){
        return "/orders/order";
    }

    @GetMapping(value="/list", produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public ResponseEntity<List<OrderDTO>> getSalesByDateRange(
            @RequestParam @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate startDate,
            @RequestParam @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate endDate) {

        LocalDateTime startDateTime = startDate.atStartOfDay();
        LocalDateTime endDateTime = endDate.atTime(23, 59, 59);

        List<OrderDTO> sales = orderService.getSalesByDateRange(startDateTime, endDateTime);
        return ResponseEntity.ok(sales);
    }

    @GetMapping("/list")
    @ResponseBody
    public List<OrderDTO> getSalesList(
            @RequestParam(required = false) String startDate,
            @RequestParam(required = false) String endDate) {

        if ((startDate == null || startDate.isBlank()) &&
                (endDate == null || endDate.isBlank())) {
            return orderService.getAllOrders(); // 전체 조회
        } else {
            return orderService.getOrdersByPeriod(startDate, endDate); // 기간 조회
        }
    }


    @GetMapping("/detail")
    @ResponseBody
    public List<OrderDetailDTO> getOrderDetails(@RequestParam("orderId") int orderId) {
        System.out.println(orderId);
        return orderService.getOrderDetailsByOrderId(orderId);
    }



}