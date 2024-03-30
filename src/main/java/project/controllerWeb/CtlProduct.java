package project.controllerWeb;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import project.model.Color;
import project.model.ImgProduct;
import project.model.Product;
import project.model.ProductDetail;
import project.service.*;

import java.util.List;

@Controller
@SessionAttributes("CARTS")
@RequestMapping("/products")
public class CtlProduct {
    @Autowired
    public CategoryService categoryService;
    @Autowired
    public ProductService productService;
    @Autowired
    public ProductDetailService productDetailService;
    @Autowired
    public ImgProductService imgProductService;
    @Autowired
    public ColorService colorService;
    @Autowired
    AccountService accountService;

    @GetMapping("/{productId}")
    public String product(Model model, 
                          @PathVariable String productId,
                          RedirectAttributes attributes
                          ) throws Exception {
        Product product = productService.findById(productId);
        if(!product.getIsProductActive()){
            attributes.addFlashAttribute("alertMessage", "Sản phẩm không tồn tại");
            return "redirect:/";
        }
        categoryService.listCategory(model);
        accountService.getAccountResponse(model);
        List<ImgProduct> imgProducts = imgProductService.findAllImgByProduct(productId);
        List<Color> colors = colorService.findColor(productId);

        List<ProductDetail> productDetails = productDetailService.findAllByProductAndColor(productId,colors.get(0).getColorId());

        model.addAttribute("title","Trang chủ");
        model.addAttribute("product",product);
        model.addAttribute("imgProducts",imgProducts);
        model.addAttribute("colors",colors);
        model.addAttribute("productDetails",productDetails );
        model.addAttribute("title", product.getProductName());

        return "web/Product";
    }

    @GetMapping("/detail")
    public String getDetail(Model model,
                            @RequestParam(value = "productId") String productId,
                            @RequestParam(value = "colorId") String colorId,
                            @RequestParam(value = "size",defaultValue = "") String size){
        Product product = productService.findById(productId);
        ProductDetail productDetail = productDetailService.findProductDetail(productId,colorId,size);

        model.addAttribute("productDetail",productDetail);
        model.addAttribute("product",product);
        return "web/component/ProductDetail";
    }

    @GetMapping("/size")
    public String getSize(Model model,
                            @RequestParam(value = "productId") String productId,
                            @RequestParam(value = "colorId") String colorId){
        List<ProductDetail> productDetails = productDetailService.findAllByProductAndColor(productId,colorId);

        model.addAttribute("productDetails",productDetails);
        model.addAttribute("productId",productId);
        return "web/component/SelectSize";
    }
}
