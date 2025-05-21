package com.aplestore.dto;

import lombok.*;

import java.time.LocalDateTime;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class OrderDTO {
    private int id;
    private int userId;
    private int orderAmount;
    private String createdAt;
    private int month;
    private int totalSales;
}