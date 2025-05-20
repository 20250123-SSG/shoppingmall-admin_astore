package com.aplestore.service;

import com.aplestore.dto.PostDTO;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;
import java.util.Map;

public interface PostService {

    Map<String, Object> getPostsAndPaging(int page);
    //int registPost(PostDTO post, int userId);
    Map<String, Object> getPostDetail(int no);
    //int modifyPost(PostDTO post);

    List<PostDTO> findAll();
    void deletePosts(List<Integer> ids);

    void createPost(PostDTO post);

    PostDTO findById(Integer id);
    void updatePost(PostDTO post);
}
