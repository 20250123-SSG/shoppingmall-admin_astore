package com.aplestore.controller;

import java.util.Map;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.aplestore.dto.StoreDTO;
import com.aplestore.service.StoreService;

@Controller
@RequiredArgsConstructor
@RequestMapping("/stores")
public class StoreController {

    private final StoreService storeService;

    @GetMapping("/list.page")
    public void listStores(@RequestParam(value="page", defaultValue = "1") int page, Model model) {
        Map<String, Object> map = storeService.getStoreList(page);
        model.addAttribute("list", map.get("list"));
        model.addAttribute("page", map.get("page"));
        model.addAttribute("totalPage", map.get("totalPage"));
        model.addAttribute("beginPage", map.get("beginPage"));
        model.addAttribute("endPage", map.get("endPage"));

    }

    @GetMapping("/detail.page")
    public void storeDetailPage(int id, Model model){

        Map<String, Object> map = storeService.getStoreDetail(id);
        model.addAttribute("store", map.get("store"));
    }

    @GetMapping("/stores/new")
    public String showCreateForm() {
        return "stores/new";
    }

    @PostMapping("/stores")
    public String createStore(StoreDTO dto) {
        storeService.createStore(dto);
        return "redirect:/stores";
    }
}