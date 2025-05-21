package com.aplestore.dto;

import lombok.*;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
@Builder
public class PostDTO {
    private int Id;
    private int boardId;
    private int userId;
    private String postSubject;
    private String postContent;
    private String postStatus;
    private String createdAt;
    private String modifiedAt;
}
