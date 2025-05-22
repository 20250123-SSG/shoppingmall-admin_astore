package com.aplestore.dto;

import lombok.*;

import java.time.LocalDateTime;

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
    private Integer modelId;
    private String modelDescription;
    private int optionalModelPrice;
    private String color;
    private String ram;
    private String size;
    private LocalDateTime createdAt;
    private LocalDateTime modifiedAt;
}