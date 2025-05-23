package com.aplestore.dao;

import com.aplestore.dto.CommentDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface CommentMapper {

    // 특정 게시글(postId)에 달린 댓글 리스트 조회
    List<CommentDTO> selectCommentsByPostId(@Param("postId") int postId);

    // 댓글 단건 조회
    CommentDTO selectCommentById(@Param("id") int id);

    // 댓글 추가
    int insertComment(CommentDTO comment);

    // 댓글 수정
    int updateComment(CommentDTO comment);

    // 댓글 삭제
    int deleteComment(@Param("id") int id);
}
