package com.aplestore.controller;

import java.util.List;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.aplestore.dto.StoreDTO;
import com.aplestore.service.StoreService;


@Controller
@RequiredArgsConstructor
public class StoreController {

    private final StoreService storeService;

    @GetMapping("/stores")
    public String listStores(Model model) {
        List<StoreDTO> stores = storeService.getStoreList();
        model.addAttribute("stores", stores);
        return "stores/list";
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

    @GetMapping("/stores/{id}")
    public String detailStore(@PathVariable int id, Model model) {
        StoreDTO store = storeService.getById(id);
        model.addAttribute("store", store);
        // photos: List<PhotoDTO> 형태로 서비스에서 함께 가져온다고 가정
//        model.addAttribute("store.photos", storeService.getPhotos(id));
        // kakaoApiKey: 앞서 설명한 @Value or @ControllerAdvice 로 자동 추가
        return "stores/detail";
    }
}