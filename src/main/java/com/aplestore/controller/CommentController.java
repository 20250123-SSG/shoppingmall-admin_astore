package com.aplestore.controller;

import com.aplestore.dto.CommentDTO;
import com.aplestore.service.CommentService;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/comments")
public class CommentController {

    private final CommentService commentService;

    public CommentController(CommentService commentService) {
        this.commentService = commentService;
    }

    // 특정 게시글 댓글 리스트 조회
    @GetMapping("/post/{postId}")
    public List<CommentDTO> getCommentsByPost(@PathVariable int postId) {
        return commentService.getCommentsByPostId(postId);
    }

    // 댓글 단건 조회
    @GetMapping("/{id}")
    public CommentDTO getComment(@PathVariable int id) {
        return commentService.getCommentById(id);
    }

    // 댓글 작성
    @PostMapping
    public int addComment(@RequestBody CommentDTO comment) {
        return commentService.addComment(comment);
    }

    // 댓글 수정
    @PutMapping("/{id}")
    public int updateComment(@PathVariable int id, @RequestBody CommentDTO comment) {
        comment.setId(id);
        return commentService.updateComment(comment);
    }

    // 댓글 삭제
    @DeleteMapping("/{id}")
    public int deleteComment(@PathVariable int id) {
        return commentService.deleteComment(id);
    }
}
