package project.fashion.admin.controllerAdmin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import project.fashion.admin.model.entity.Color;
import project.fashion.admin.model.entity.Product;
import project.fashion.admin.model.entity.ProductDetail;
import project.fashion.admin.model.entity.Size;
import project.fashion.admin.model.service.*;

import java.util.List;

@Controller
@PreAuthorize("hasAnyRole('MANAGER')")
@RequestMapping("/admin/productDetail")
public class CtlAdminProductDetail {
    @Autowired
    private ProductDetailService productDetailService;

    @Autowired
    private SizeService sizeService;

    @Autowired
    private ColorService colorService;

    @Autowired
    private ProductService productService;

    @Autowired
    private AccountService accountService;

    @GetMapping("/add-prDetail")
    public String addProductDetail(Model model,@RequestParam("productId") String productId) {
        List<Size> s = sizeService.findAll();
        List<Color> cl = colorService.findAll();
        ProductDetail pd = new ProductDetail();
        accountService.getAccountResponse(model);

        model.addAttribute("productId", productId);
        model.addAttribute("s", s);
        model.addAttribute("cl", cl);
        model.addAttribute("pd", pd);
        model.addAttribute("select","product");
        return "/admin/AddProductDetail";
    }

    @PostMapping("/add-prDetail")
    public ResponseEntity<String> addPrDetail(@ModelAttribute ProductDetail productDetail, @RequestParam("productId") String productId) {
        System.out.println(productDetail);
        return productDetailService.save(productId,productDetail);
    }

    @GetMapping("update-detail/{prDetailId}")
    public String updateProductDetail(Model model, @PathVariable("prDetailId") Integer prDetailId) {
        List<Color> color = colorService.findAll();
        List<Size> size = sizeService.findAll();
        List<Product> product =  productService.findAll();
        ProductDetail pd = productDetailService.getById(prDetailId);

        accountService.getAccountResponse(model);

        model.addAttribute("color", color);
        model.addAttribute("size", size);
        model.addAttribute("product", product);
        model.addAttribute("pd",pd);
        model.addAttribute("select","product");
        return "/admin/UpdatePrDetail";
    }

    @PutMapping("update-detail")
    public ResponseEntity<String> updateProductDetail(@ModelAttribute ProductDetail pd) {
        return productDetailService.updatePrDetail(pd);

    }

    @DeleteMapping ("/delete/prDetail")
    public ResponseEntity<Void> deleteProductDetail(@RequestParam("prDetailId") Integer prDetailId) {
        productDetailService.deleteById(prDetailId);
         return ResponseEntity.ok().build();
    }

}
