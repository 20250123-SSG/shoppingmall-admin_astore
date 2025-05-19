package com.aplestore.controller;

import java.util.Map;

import com.aplestore.dto.StoreDTO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

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

    @GetMapping("/regist.page")
    public void registPage(){}

    @PostMapping("/new")
    public String storeRegist(@ModelAttribute StoreDTO storeDTO){

        storeService.registStore(storeDTO);

        return "redirect:/stores/list.page";
    }

}