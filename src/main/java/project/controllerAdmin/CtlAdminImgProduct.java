package project.controllerAdmin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import project.model.ImgProduct;
import project.model.Product.Product;
import project.service.AccountService;
import project.service.FeedbackCustomerService;
import project.service.ImgProductService;
import project.service.ProductService;

import java.io.*;
import java.util.List;

@Controller
@RequestMapping("/admin/imgProduct")
@PreAuthorize("hasAnyRole('MANAGER')")
public class CtlAdminImgProduct {
    @Autowired
    private ImgProductService imgProductService;
    @Autowired
    private AccountService accountService;
    @Autowired
    private ProductService productService;
    @Autowired
    FeedbackCustomerService feedbackCustomerService;
    

    @GetMapping("/add-img")
    public String addImg(Model model, @RequestParam("productId") String productId) {
        List<ImgProduct> imgProducts = imgProductService.findAllImgByProduct(productId);

        ImgProduct img = new ImgProduct();

        accountService.getAccountResponse(model);
        feedbackCustomerService.countUnread(model);

        Product product = productService.findById(productId);
        model.addAttribute("productId", productId);
        model.addAttribute("img", img);
        model.addAttribute("imgProducts", imgProducts);
        model.addAttribute("title","Product");
        model.addAttribute("product", product);
        return "admin/ImgProduct";
    }

    @PostMapping("/add-img")
    public String addImgPr(@RequestParam("productId") String productId,
                           @RequestParam(value = "file", required = false) MultipartFile[] files,
                           RedirectAttributes attributes) {
        try{
            imgProductService.addImg(files, productId);
            attributes.addFlashAttribute("alertMessage", "Đã thêm thành công");
            return "redirect:/admin/imgProduct/add-img?productId=" + productId;
        }catch (Exception e){
            attributes.addFlashAttribute("alertMessage", e);
            return "redirect:/admin/imgProduct/add-img?productId=" + productId;
        }


    }

    @PostMapping ("/img-bg")
    public ResponseEntity<String> changeImg(
                            @RequestParam("imageName") String imageName,
                            @RequestParam("productId") String productId) {
        productService.setBackground(productId, imageName);

        return ResponseEntity.ok(imageName);

    }

    @DeleteMapping("/delete")
    public String deleteImg(@RequestParam("imageName") String imageName,
                            @RequestParam("productId") String productId,
                            RedirectAttributes attributes) throws IOException {
        try {
            imgProductService.deleteByFileImg(imageName);
            attributes.addFlashAttribute("alertMessage", "Đã xóa thành công");
            return "redirect:/admin/imgProduct/add-img?productId=" +productId;
        } catch (Exception e) {
            attributes.addFlashAttribute("alertMessage", "Có lỗi không thể xóa");
            return "redirect:/admin/banner";
        }
    }

}
