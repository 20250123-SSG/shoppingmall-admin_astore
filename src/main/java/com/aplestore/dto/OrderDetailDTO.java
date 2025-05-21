package com.aplestore.dto;

import lombok.*;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class OrderDetailDTO {
    private int id;
    private int modelOptionId;
    private int orderId;
    private int orderQuantity;
    private int orderPrice;

    // model_options DTO 포함
    private ProductModelOptionDTO modelOption;
}
