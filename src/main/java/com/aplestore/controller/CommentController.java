package com.aplestore.controller;

import com.aplestore.dto.CommentDTO;
import com.aplestore.dto.LoginDTO;
import com.aplestore.dto.UserDTO;
import com.aplestore.service.CommentService;
import jakarta.servlet.http.HttpSession;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

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

    // 3) 댓글 작성
    @PostMapping
    public ResponseEntity<?> addComment(
            @RequestBody CommentDTO comment,
            HttpSession session
    ) {
        // 1) 로그인 세션에서 LoginDTO 꺼내기
        LoginDTO login = (LoginDTO) session.getAttribute("loginMember");
        if (login == null) {
            return ResponseEntity
                    .status(HttpStatus.UNAUTHORIZED)
                    .body(Map.of("success", false, "message", "로그인이 필요합니다."));
        }

        // 2) LoginDTO 의 userId 또는 id 필드로 세팅
        comment.setUserId(login.getUserId());
        // 만약 LoginDTO 에 getId() 만 있고 getUserId()가 없다면
        // comment.setUserId(login.getId());

        // 3) 댓글 등록
        int result = commentService.addComment(comment);
        return ResponseEntity.ok(Map.of("success", true, "inserted", result));
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
