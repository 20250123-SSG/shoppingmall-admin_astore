package com.aplestore.controller;

import com.aplestore.common.PageUtil;
import com.aplestore.dto.ProductModelDTO;
import com.aplestore.dto.ProductModelOptionDTO;
import com.aplestore.service.ProductService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;

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

    @GetMapping("/{model-id}")
    public String getProductDetail(@PathVariable("model-id") Integer id, Model model) {
        List<ProductModelOptionDTO> options = productService.getProductDetail(id);

        if (options.isEmpty()) {
            // 예외 처리 또는 기본 페이지로 리다이렉트 등
            return "redirect:/products";
        }


        ProductModelOptionDTO selectedOption = options.get(0);
        System.out.println(selectedOption.getModelPrice());

        model.addAttribute("modelId",id);
        model.addAttribute("productName", selectedOption.getProductName());
        model.addAttribute("modelName", selectedOption.getModelName());
        model.addAttribute("modelDescription", selectedOption.getModelDescription());
        model.addAttribute("modelPrice", selectedOption.getModelPrice());

        // options를 JSON 문자열로 변환
        ObjectMapper mapper = new ObjectMapper();
        mapper.registerModule(new JavaTimeModule());
        mapper.disable(SerializationFeature.WRITE_DATES_AS_TIMESTAMPS);

        String optionsJson = "";
        try {
            optionsJson = mapper.writeValueAsString(options);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }

        model.addAttribute("optionsJson", optionsJson);
        return "products/detail";
    }

    @PostMapping("/options/remove")
    public String removeModelOption(ProductModelOptionDTO dto, RedirectAttributes redirectAttributes) {
        int result = productService.removeModelOption(dto);

        if (result > 0) {
            redirectAttributes.addFlashAttribute("message", "옵션이 삭제되었습니다.");
        } else {
            redirectAttributes.addFlashAttribute("message", "옵션 삭제에 실패했습니다.");
        }

        return "redirect:/products/list.page"; // 목록 페이지로

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

        String newFilename = product.getModelName() + "_" + product.getColor() + "_" + product.getRam() + "_" + product.getSize() + ".png";
        File saveFile = new File(dir, newFilename);

        try {
            uploadFile.transferTo(saveFile);
        } catch (IOException e) {
            e.printStackTrace();
        }

        return "redirect:/products";
    }

    @GetMapping("/edit.page")
    public String editPage(@RequestParam Integer modelId,
                           @ModelAttribute ProductModelOptionDTO product,
                           Model model) {
        product.setModelId(modelId);
        model.addAttribute("model", product);
        return "products/edit";
    }

    @PostMapping("/edit")
    public String editProduct(ProductModelOptionDTO product){
        int modelId = product.getModelId();
        int result = productService.saveChangeInfo(product);
        if (result == 1){ } //수정성공
        return "redirect:/products/" + product.getModelId();
    }

}