package com.aplestore.controller;

import com.aplestore.common.PageUtil;
import com.aplestore.dto.ProductModelDTO;
import java.util.List;
import java.util.Map;
import com.aplestore.dto.ProductModelOptionDTO;
import com.aplestore.dto.StoreDTO;
import jakarta.servlet.http.HttpServletRequest;
import lombok.*;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.aplestore.service.ProductService;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.List;

@Slf4j
@RequiredArgsConstructor
@RequestMapping("/products")
@Controller
public class ProductController {

    private final ProductService productService;

    private final PageUtil pageUtil;

    @GetMapping("")
    public String mainPage() {
        return "redirect:/products/list.page";
    }

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

    @GetMapping("/regist")
    public String registPage() {
        return "products/regist";
    }


    @PostMapping("/regist")
    public String registProduct(ProductModelOptionDTO product, @RequestParam("uploadFile") MultipartFile uploadFile) {
        int result = productService.registProduct(product);
        if (result == 0) {
            log.debug("다시 입력해주십시오. 등록페이지로 돌아갑니다.");
            return "products/regist";
        }

        String imgPath = "C:/upload/";
        File dir = new File(imgPath);
        if (!dir.exists()) {
            dir.mkdirs();
        }

        String newFilename = product.getModelName() + "_" + product.getId().toString() + ".png";
        File saveFile = new File(dir, newFilename);

        try {
            uploadFile.transferTo(saveFile);
        } catch (IOException e) {
            log.debug("파일 저장에 실패하였습니다. ", e);
            e.printStackTrace();
        }
        log.debug("상품등록성공하였습니다. 이미지는 upload폴더를 확인해주세요.");
        return "redirect:/products";
    }

    @GetMapping("/edit")
    public String editPage(ProductModelOptionDTO product, Model model){
        // 조회가 필요하다면 여기서 진행
        // ProductModelOptionDTO productDetail = productService.getAllModelOption(product);
        model.addAttribute("model", product);
        return "products/edit";
    }

    @PostMapping("/edit")
    public String savechangeInfo(ProductModelOptionDTO product){
        int result = productService.saveChangeInfo(product);

        return "redirect:products/edit"; // TODO: 상품상세페이지로 변경
    }



}