package com.aplestore.dto;

import lombok.*;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class BoardDTO {
    private int id;
    private String boardName;
    private String boardDescription;
    private String createdAt;
    private String modifiedAt;

}
