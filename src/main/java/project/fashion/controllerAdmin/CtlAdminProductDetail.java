package project.fashion.controllerAdmin;

import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import project.fashion.entity.*;
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
    private ProductService productService;

    @Autowired
    private ColorService colorService;

    @Autowired
    private SizeService sizeService;


    @GetMapping("/add-prDetail")
    public String addProductDetail(Model model,@RequestParam("productId") String productId) {
        List<Size> s = sizeService.findAll();
        List<Color> cl = colorService.findAll();
        ProductDetail pd = new ProductDetail();
        model.addAttribute("productId", productId);
        model.addAttribute("s", s);
        model.addAttribute("cl", cl);
        model.addAttribute("pd", pd);
        return "/admin/AddProductDetail";
    }

    @PostMapping("/add-prDetail")
    public String addPrDetail(@ModelAttribute ProductDetail productDetail, @RequestParam("productId") String productId) {
        Product product = productService.getById(productId);
        productDetail.setProduct(product);

        productDetailService.save(productDetail);

        var p = productDetail.getProduct().getProductId();
        return "redirect:/admin/product/update-product/" + p;
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
        return "/admin/UpdatePrDetail";
    }

    @PutMapping("update-detail/{prDetailId}")
    @Transactional
    public String updateProductDetail(@PathVariable("prDetailId") Integer prDetailId,@ModelAttribute ProductDetail pd) {
        pd.setProductDetailId(prDetailId);
        var productId = pd.getProduct().getProductId();
        System.out.println("--------------------" + pd);
        productDetailService.save(pd);
        return "redirect:/admin/product/update-product/" + productId;
    }

    @GetMapping ("/delete/prDetail")
    @Transactional
    public String deleteProductDetail(@RequestParam("prDetailId") Integer prDetailId, Model model) {
        ProductDetail pd = productDetailService.getById(prDetailId);
        var productId = pd.getProduct().getProductId();

        productDetailService.deleteById(prDetailId);
        return "redirect:/admin/product/update-product/" + productId;
    }

}
