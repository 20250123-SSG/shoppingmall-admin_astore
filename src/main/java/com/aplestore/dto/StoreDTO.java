package com.aplestore.dto;

import lombok.*;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Map;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
@Builder
public class StoreDTO {
    private int id;
    private String storeName;
    private String storeNumber;
    private String storeAddress;
    private int storeOffDay;
    private String storeZipCode;
    private BigDecimal storeLat;
    private BigDecimal storeLon;
    private Character storeStatus;
    private LocalDateTime createdAt;
    private LocalDateTime modifiedAt;

    public String getOffDayName() {
        Map<Integer, String> dayMap = Map.of(
                1, "월요일",
                2, "화요일",
                3, "수요일",
                4, "목요일",
                5, "금요일",
                6, "토요일",
                7, "일요일"
        );
        return dayMap.getOrDefault(storeOffDay, "알 수 없음");
    }

    public String getBusinessStatus() {
        int today = LocalDate.now().getDayOfWeek().getValue();
        return (storeOffDay == today) ? "휴무일" : "영업 중";
    }

//    public int getStoreOffDay() {
//        return storeOffDay;
//    }
}
