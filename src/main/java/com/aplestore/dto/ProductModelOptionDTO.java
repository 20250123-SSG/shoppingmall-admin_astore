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
    private Integer id; //modeloption에 있는 id
    private String productName;
    private String modelName;
    private int modelPrice;
    private int modelId; //이게 없어서...
    private String modelDescription;
    private int optionalModelPrice;
    private String color;
    private String ram;
    private String size;
    private LocalDateTime createdAt;
    private LocalDateTime modifiedAt;
}