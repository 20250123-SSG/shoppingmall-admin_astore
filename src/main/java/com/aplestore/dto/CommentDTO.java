package com.aplestore.dto;

import lombok.*;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class CommentDTO {
    private int id;
    private int postId;
    private int userId;
    private String commentContent;
    private String createdAt;
    private String modifiedAt;
}

