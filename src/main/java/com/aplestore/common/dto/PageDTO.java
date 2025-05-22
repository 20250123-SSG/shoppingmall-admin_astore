package com.aplestore.common.dto;

import lombok.*;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class PageDTO {
    private int page;          // 현재 페이지
    private int size;          // 페이지당 항목 수
    private int totalPages;    // 전체 페이지 수
    private long totalItems;   // 전체 항목 수
    private boolean first;     // 첫 페이지 여부
    private boolean last;      // 마지막 페이지 여부

    public PageDTO(int page, int size, long totalItems) {
        this.page = page;
        this.size = size;
        this.totalItems = totalItems;
        this.totalPages = (int) Math.ceil((double) totalItems / size);
        this.first = page == 1;
        this.last = page == totalPages;
    }

    public int getOffset() {
        return (page - 1) * size;
    }
}