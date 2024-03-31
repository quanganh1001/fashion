package project.controllerAdmin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import project.Enum.SizeEnumDTO;
import project.model.Color;
import project.model.Product;
import project.model.ProductDetail;
import project.service.*;

import java.util.Arrays;
import java.util.List;

@Controller
@PreAuthorize("hasAnyRole('MANAGER')")
@RequestMapping("/admin/productDetail")
public class CtlAdminProductDetail {
    @Autowired
    private ProductDetailService productDetailService;
    @Autowired
    private ColorService colorService;
    @Autowired
    private ProductService productService;
    @Autowired
    private AccountService accountService;
    @Autowired
    FeedbackCustomerService feedbackCustomerService;

    @GetMapping("/add-prDetail")
    public String addProductDetail(Model model,@RequestParam("productId") String productId) {
        List<SizeEnumDTO> sizes = Arrays.asList(SizeEnumDTO.values());
        List<Color> colors = colorService.findAll();
        accountService.getAccountResponse(model);
        feedbackCustomerService.countUnread(model);

        model.addAttribute("productId", productId);
        model.addAttribute("sizes", sizes);
        model.addAttribute("colors", colors);
        model.addAttribute("color",new Color());
        model.addAttribute("pd", new ProductDetail());
        model.addAttribute("title","Product");
        return "admin/AddProductDetail";
    }

    @PostMapping("/add-prDetail")
    public String addPrDetail(@ModelAttribute ProductDetail productDetail,
                              @RequestParam("productId") String productId,
                              RedirectAttributes attributes) {
        return productDetailService.save(productId,productDetail,attributes);
    }

    @GetMapping("update-detail/{prDetailId}")
    public String updateProductDetail(Model model, @PathVariable("prDetailId") Integer prDetailId) {
        List<Color> colors = colorService.findAll();
        List<SizeEnumDTO> sizes = Arrays.asList(SizeEnumDTO.values());
        List<Product> product =  productService.findAll();
        ProductDetail pd = productDetailService.getById(prDetailId);
        feedbackCustomerService.countUnread(model);

        accountService.getAccountResponse(model);

        model.addAttribute("colors", colors);
        model.addAttribute("color", new Color());
        model.addAttribute("sizes", sizes);
        model.addAttribute("product", product);
        model.addAttribute("pd",pd);
        model.addAttribute("title","Product");
        return "admin/UpdatePrDetail";
    }

    @PutMapping("update-detail")
    public String updateProductDetail(@ModelAttribute ProductDetail pd,
                                                      RedirectAttributes attributes) throws Exception {
        return productDetailService.updatePrDetail(pd,attributes);

    }

    @DeleteMapping ("/delete/prDetail")
    public String deleteProductDetail(@RequestParam("prDetailId") Integer prDetailId,
                                      @RequestParam("productId") String productId,
                                      RedirectAttributes attributes) {
        try{
            productDetailService.deleteById(prDetailId);
            attributes.addFlashAttribute("alertMessage","Đã xóa sản phẩm");
            return "redirect:/admin/product/update-product/"+productId;
        }catch (Exception e){
            attributes.addFlashAttribute("alertMessage","Không thể xóa");
            return "redirect:/admin/product/update-product/"+productId;
        }

    }

}
