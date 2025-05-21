package com.aplestore.service;

import com.aplestore.common.PageUtil;
import com.aplestore.dao.PostMapper;
import com.aplestore.dto.PostDTO;
import lombok.RequiredArgsConstructor;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RequiredArgsConstructor
@Service
public class PostServiceImpl implements PostService {
    private final SqlSessionTemplate sqlSession;
    private final PageUtil pageUtil;
    @Override
    public Map<String, Object> getPostsAndPaging(int page) {

        PostMapper postMapper = sqlSession.getMapper(PostMapper.class);

        int totalCount = postMapper.selectPostListCount();
        Map<String , Object> map = pageUtil.getPageInfo(totalCount, page, 5,5);
        List<PostDTO> list = postMapper.selectPostList(map);
        map.put("list",list);
        return map;
    }

//    @Override
//    public int registPost(PostDTO post,int userId) {
//        PostMapper postMapper = sqlSession.getMapper(PostMapper.class);
//        post.setUserId(userId);
//
//        return postMapper.insertPost(post);
//    }


    @Override
    public Map<String, Object> getPostDetail(int no) {

        PostMapper postMapper = sqlSession.getMapper(PostMapper.class);

        PostDTO post = postMapper.selectPostByNo(no);

        Map<String, Object> map = new HashMap<>();
        map.put("post", post);

        return map;
    }
//    @Override
//    public int modifyPost(PostDTO post) {
//        return sqlSession.getMapper(PostMapper.class).updatePost(post);
//    }

    @Autowired
    private PostMapper mapper;

    @Override
    public List<PostDTO> findAll() {
        return mapper.selectAll();
    }

    @Override
    @Transactional
    public void deletePosts(List<Integer> ids) {
        mapper.deleteByIds(ids);
    }

    @Autowired
    private PostMapper postMapper;
    @Override
    @Transactional
    public void createPost(PostDTO post) {
        postMapper.insertPost(post);
    }

    @Override
    public PostDTO findById(Integer id) {
        return postMapper.selectById(id);
    }
    @Override
    @Transactional
    public void updatePost(PostDTO post) {
        postMapper.updatePost(post);
    }
}
