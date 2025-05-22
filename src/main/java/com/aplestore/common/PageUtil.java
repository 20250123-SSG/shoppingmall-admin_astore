package com.aplestore.common;

import org.springframework.stereotype.Component;

import java.util.HashMap;
import java.util.Map;

@Component
public class PageUtil {
    /**
     *
     * @param totalCount        게시글 총 개수
     * @param page              현재 페이지 번호
     * @param display           한 페이지당 게시글 개수
     * @param pagePerBlock      페이징 바의 숫자
     */
    public Map<String,Object> getPageInfo(int totalCount, int page, int display, int pagePerBlock){

        int totalPage = (int)Math.ceil((double)totalCount / display);
        int beginPage = (page - 1) / pagePerBlock * pagePerBlock + 1;
        int endPage = Math.min(beginPage + pagePerBlock - 1, totalPage);
        int offset = (page - 1) * display;

        Map<String, Object> map = new HashMap<>();

         map.put("totalCount", totalCount);
         map.put("page", page);
         map.put("display", display);
         map.put("pagePerBlock", pagePerBlock);
         map.put("totalPage", totalPage);
         map.put("beginPage", beginPage);
         map.put("endPage", endPage);
         map.put("offset", offset);

        return map;
    }
}
