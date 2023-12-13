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

import java.util.List;

@Controller
@RequestMapping("/admin/productDetail")
public class CtlAdminProductDetail {
    @Autowired
    private ProductDetailRepo productDetailRepo;

    @Autowired
    private ProductRepo productRepo;

    @Autowired
    private ColorRepo colorRepo;

    @Autowired
    private SizeRepo sizeRepo;


    @GetMapping("/add-prDetail")
    public String addProductDetail(Model model,@RequestParam("productId") String productId) {
        List<Size> s = sizeRepo.findAll();
        List<Color> cl = colorRepo.findAll();
        ProductDetail pd = new ProductDetail();
        model.addAttribute("productId", productId);
        model.addAttribute("s", s);
        model.addAttribute("cl", cl);
        model.addAttribute("pd", pd);
        model.addAttribute("select",true);
        return "/admin/AddProductDetail";
    }

    @PostMapping("/add-prDetail")
    public String addPrDetail(@ModelAttribute ProductDetail productDetail, @RequestParam("productId") String productId) {
        Product product = productRepo.getById(productId);
        productDetail.setProduct(product);

        productDetailRepo.save(productDetail);

        var p = productDetail.getProduct().getProductId();
        return "redirect:/admin/product/update-product/" + p;
    }

    @GetMapping("update-detail/{prDetailId}")
    public String updateProductDetail(Model model, @PathVariable("prDetailId") Integer prDetailId) {
        List<Color> color = colorRepo.findAll();
        List<Size> size = sizeRepo.findAll();
        List<Product> product =  productRepo.findAll();
        ProductDetail pd = productDetailRepo.getById(prDetailId);

        model.addAttribute("color", color);
        model.addAttribute("size", size);
        model.addAttribute("product", product);
        model.addAttribute("pd",pd);
        model.addAttribute("select",true);
        return "/admin/UpdatePrDetail";
    }

    @PutMapping("update-detail/{prDetailId}")
    public String updateProductDetail(@PathVariable("prDetailId") Integer prDetailId,@ModelAttribute ProductDetail pd) {
        pd.setProductDetailId(prDetailId);

        productDetailRepo.save(pd);
        return "redirect:/admin/productDetail/update-detail/"+prDetailId;
    }

    @DeleteMapping ("/delete/prDetail")
    public ResponseEntity<Void> deleteProductDetail(@RequestParam("prDetailId") Integer prDetailId) {
         productDetailRepo.deleteById(prDetailId);
         return ResponseEntity.ok().build();
    }

}
