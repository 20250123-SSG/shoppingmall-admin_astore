package com.aplestore.service;

import com.aplestore.dao.CommentMapper;
import com.aplestore.dto.CommentDTO;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CommentServiceImpl implements CommentService {

    private final CommentMapper commentMapper;

    public CommentServiceImpl(CommentMapper commentMapper) {
        this.commentMapper = commentMapper;
    }

    @Override
    public List<CommentDTO> getCommentsByPostId(int postId) {
        return commentMapper.selectCommentsByPostId(postId);
    }

    @Override
    public CommentDTO getCommentById(int id) {
        return commentMapper.selectCommentById(id);
    }

    @Override
    public int addComment(CommentDTO comment) {
        return commentMapper.insertComment(comment);
    }

    @Override
    public int updateComment(CommentDTO comment) {
        return commentMapper.updateComment(comment);
    }

    @Override
    public int deleteComment(int id) {
        return commentMapper.deleteComment(id);
    }
}
