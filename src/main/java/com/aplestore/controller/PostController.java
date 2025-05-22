package com.aplestore.controller;

import com.aplestore.dto.BoardDTO;
import com.aplestore.dto.PostDTO;
import com.aplestore.service.BoardService;
import com.aplestore.service.PostService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import java.util.List;
import java.util.Map;

@Controller
@RequiredArgsConstructor
@RequestMapping("/post")
public class PostController {

    private final PostService  postService;
    private final BoardService boardService;


    @GetMapping("/list.page")
    public String listByBoard(
            @RequestParam(value="boardId", required=false) Integer boardId,
            @RequestParam(value="page",    defaultValue="1") int page,
            @RequestParam(value="keyword", required=false) String keyword,
            Model model
    ) {
        // 게시판 목록과 selectedBoardId 셋업 (기존 코드)
        List<BoardDTO> boards = boardService.findAll();
        if (boardId == null && !boards.isEmpty()) {
            boardId = boards.get(0).getId();
        }

        // 검색 + 페이징 처리
        Map<String,Object> map = postService
                .getPostsAndPagingByBoard(boardId, page, keyword);

        // 뷰에 필요한 값 일괄 추가
        model.addAttribute("boards",          boards);
        model.addAttribute("selectedBoardId", boardId);
        model.addAllAttributes(map);
        return "post/list";
    }

    /** 상세 보기 */
    @GetMapping("/detail.page")
    public String detail(
            @RequestParam("no")       Integer no,
            @RequestParam(value="boardId", required=false) Integer boardId,
            Model model
    ) {
        model.addAttribute("post",               postService.findById(no));
        model.addAttribute("boards",             boardService.findAll());
        model.addAttribute("selectedBoardId",    boardId);
        return "post/detail";
    }

    /** 글쓰기 폼 */
    @GetMapping("/regist.page")
    public String showRegistForm(
            @RequestParam(value="boardId", required=false) Integer boardId,
            Model model
    ) {
        List<BoardDTO> boards = boardService.findAll();
        if (boardId == null && !boards.isEmpty()) {
            boardId = boards.get(0).getId();
        }
        model.addAttribute("boards",          boards);
        model.addAttribute("selectedBoardId", boardId);
        model.addAttribute("post",            new PostDTO());
        return "post/regist";
    }

    /** 글쓰기 처리 */
    @PostMapping("/regist")
    public String doRegist(
            @ModelAttribute PostDTO postDTO,
            @RequestParam("boardId") Integer boardId,
            RedirectAttributes ra
    ) {
        postDTO.setBoardId(boardId);
        postDTO.setPostStatus("1");
        postService.createPost(postDTO);
        ra.addAttribute("boardId", boardId);
        ra.addFlashAttribute("msg", "새 글이 등록되었습니다.");
        return "redirect:/post/list.page";
    }

    /** 수정 폼 */
    @GetMapping("/modify.page")
    public String showEditForm(
            @RequestParam("no")       Integer id,
            @RequestParam("boardId")  Integer boardId,
            Model model
    ) {
        model.addAttribute("post",            postService.findById(id));
        model.addAttribute("boards",          boardService.findAll());
        model.addAttribute("selectedBoardId", boardId);
        return "post/modify";
    }

    /** 수정 처리 */
    @PostMapping("/edit")
    public String doEdit(
            @ModelAttribute PostDTO postDTO,
            @RequestParam("boardId") Integer boardId,
            @RequestParam(value="page", defaultValue="1") int page,
            RedirectAttributes ra
    ) {
        postDTO.setBoardId(boardId);
        postService.updatePost(postDTO);


        ra.addAttribute("boardId", boardId);
        ra.addAttribute("page",     page);
        ra.addFlashAttribute("msg", "글이 수정되었습니다.");
        return "redirect:/post/list.page";
    }
    /** 선택 삭제 */
    @PostMapping("/delete")
    public String delete(
            @RequestParam(value="postIds", required=false) List<Integer> ids,
            @RequestParam("boardId")           Integer boardId,
            RedirectAttributes ra
    ) {
        if (ids == null || ids.isEmpty()) {
            ra.addAttribute("boardId", boardId);
            ra.addFlashAttribute("msg", "삭제할 글을 하나 이상 선택해주세요.");
            return "redirect:/post/list.page";
        }
        postService.deletePosts(ids);
        ra.addAttribute("boardId", boardId);
        ra.addFlashAttribute("msg", "선택된 글이 삭제되었습니다.");
        return "redirect:/post/list.page";
    }

    }
