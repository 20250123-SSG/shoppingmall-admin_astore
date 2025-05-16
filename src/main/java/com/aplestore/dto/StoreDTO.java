package com.aplestore.dto;

import lombok.*;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalDateTime;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class StoreDTO {
    private int id;
    private String storeName;
    private String storeNumber;
    private String storeAddress;
    private int storeOffDay;
    private String storeZipCode;
    private BigDecimal storeLat;
    private BigDecimal storeLon;
    private LocalDateTime createdAt;
    private LocalDateTime modifiedAt;

    public String getStoreOffDay() {
        int today = LocalDate.now().getDayOfWeek().getValue();
        return (storeOffDay == today) ? "휴무일" : "영업 중";
    }
}
