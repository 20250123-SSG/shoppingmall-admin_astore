package com.aplestore.controller;

import com.aplestore.common.PageUtil;
import com.aplestore.dto.ProductModelDTO;
import java.util.List;
import java.util.Map;
import lombok.*;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.aplestore.service.ProductService;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Slf4j
@RequiredArgsConstructor
@RequestMapping("/products")
@Controller
public class ProductController {

    private final ProductService productService;

    private final PageUtil pageUtil;

    @GetMapping("/list.page")
    public void productListPage(@RequestParam(defaultValue = "1") int page,
                                  @RequestParam(defaultValue = "5") int display,
                                  @RequestParam(defaultValue = "5") int pagePerBlock,
                                  @RequestParam(required = false) String keyword,
                                  @RequestParam(required = false) String sort,
                                  Model model) {

        int totalCount = productService.countAllModels(keyword);
        Map<String, Object> pageInfo = pageUtil.getPageInfo(totalCount, page, display, pagePerBlock);

        List<ProductModelDTO> products = productService.getAllModels(
                (int) pageInfo.get("offset"), display, keyword, sort
        );
        System.out.println(products);



        model.addAttribute("list", products);
        model.addAttribute("pageInfo", pageInfo);
        model.addAttribute("keyword", keyword);
        model.addAttribute("sort", sort);

    }

    @GetMapping("/suggest")
    @ResponseBody
    public List<String> suggestKeyword(@RequestParam String keyword) {
        return productService.suggestKeyword(keyword);
    }




















}