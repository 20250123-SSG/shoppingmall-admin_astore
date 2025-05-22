package com.aplestore.service;

import com.aplestore.dto.CommentDTO;

import java.util.List;

public interface CommentService {
    List<CommentDTO> getCommentsByPostId(int postId);
    CommentDTO getCommentById(int id);
    int addComment(CommentDTO comment);
    int updateComment(CommentDTO comment);
    int deleteComment(int id);
}
