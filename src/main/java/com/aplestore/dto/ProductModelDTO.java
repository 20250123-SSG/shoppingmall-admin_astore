package com.aplestore.dto;

import java.time.LocalDateTime;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class ProductModelDTO {
    private String productName;
    private String modelName;
    private int modelPrice;
    private LocalDateTime createdAt;
    private LocalDateTime modifiedAt;
}
