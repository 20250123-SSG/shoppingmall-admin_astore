package com.aplestore.service;

import com.aplestore.common.PageUtil;
import com.aplestore.dao.PostMapper;
import com.aplestore.dto.PostDTO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class PostServiceImpl implements PostService {

    private final PostMapper postMapper;
    private final PageUtil   pageUtil;

    @Override
    public Map<String,Object> getPostsAndPagingByBoard(Integer boardId, int page) {
        int totalCount = postMapper.countByBoard(boardId);
        Map<String,Object> pageInfo = pageUtil.getPageInfo(
                totalCount, page, 10, 5
        );
        int offset  = (Integer) pageInfo.get("offset");
        int display = (Integer) pageInfo.get("display");

        List<PostDTO> list = postMapper.selectByBoardWithLimit(
                boardId, offset, display
        );
        pageInfo.put("list",    list);
        pageInfo.put("boardId", boardId);
        return pageInfo;
    }

    @Override
    public PostDTO findById(Integer id) {
        return postMapper.selectById(id);
    }

    @Override
    public void createPost(PostDTO post) {
        postMapper.insertPost(post);
    }

    @Override
    public void updatePost(PostDTO post) {
        postMapper.updatePost(post);
    }

    @Override
    public void deletePosts(List<Integer> ids) {
        postMapper.deleteByIds(ids);
    }
}
