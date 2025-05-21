package com.aplestore.dto;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import lombok.*;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class ProductModelOptionDTO {
    private Integer id;
    private String productName;
    private String modelName;
    private String modelDescription;
    private String modelPrice;
    private int optionalModelPrice;
    private String color;
    private String ram;
    private String size;
    private LocalDateTime createdAt;
    private LocalDateTime modifiedAt;
}