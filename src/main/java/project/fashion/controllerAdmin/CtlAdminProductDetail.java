package project.fashion.controllerAdmin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import project.fashion.entity.*;
import project.fashion.repository.ColorRepo;
import project.fashion.repository.ProductDetailRepo;
import project.fashion.repository.ProductRepo;
import project.fashion.repository.SizeRepo;
import project.fashion.service.ColorService;
import project.fashion.service.ProductDetailService;
import project.fashion.service.ProductService;
import project.fashion.service.SizeService;

import java.util.List;

@Controller
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

    @GetMapping("/add-prDetail")
    public String addProductDetail(Model model,@RequestParam("productId") String productId) {
        List<Size> s = sizeService.findAll();
        List<Color> cl = colorService.findAll();
        ProductDetail pd = new ProductDetail();
        model.addAttribute("productId", productId);
        model.addAttribute("s", s);
        model.addAttribute("cl", cl);
        model.addAttribute("pd", pd);
        model.addAttribute("select",true);
        return "/admin/AddProductDetail";
    }

    @PostMapping("/add-prDetail")
    public ResponseEntity<String> addPrDetail(@ModelAttribute ProductDetail productDetail, @RequestParam("productId") String productId) {
        return productDetailService.save(productId,productDetail);
    }

    @GetMapping("update-detail/{prDetailId}")
    public String updateProductDetail(Model model, @PathVariable("prDetailId") Integer prDetailId) {
        List<Color> color = colorService.findAll();
        List<Size> size = sizeService.findAll();
        List<Product> product =  productService.findAll();
        ProductDetail pd = productDetailService.getById(prDetailId);

        model.addAttribute("color", color);
        model.addAttribute("size", size);
        model.addAttribute("product", product);
        model.addAttribute("pd",pd);
        model.addAttribute("select",true);
        return "/admin/UpdatePrDetail";
    }

    @PutMapping("update-detail/{prDetailId}")
    public ResponseEntity<String> updateProductDetail(@PathVariable("prDetailId") Integer prDetailId,
                                       @ModelAttribute ProductDetail pd) {
        return productDetailService.updatePrDetail(prDetailId,pd);

    }

    @DeleteMapping ("/delete/prDetail")
    public ResponseEntity<Void> deleteProductDetail(@RequestParam("prDetailId") Integer prDetailId) {
        productDetailService.deleteById(prDetailId);
         return ResponseEntity.ok().build();
    }

}
