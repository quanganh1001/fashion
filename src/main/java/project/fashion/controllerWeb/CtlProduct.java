package project.fashion.controllerWeb;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import project.fashion.model.entity.*;
import project.fashion.model.service.*;

import java.net.MalformedURLException;
import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/products")
public class CtlProduct {
    @Autowired
    public CategoryService categoryService;
    @Autowired
    public ProductService productService;
    @Autowired
    public ProductDetailService productDetailService;
    @Autowired
    public ImgSizeService imgSizeService;
    @Autowired
    public ImgProductService imgProductService;
    @Autowired
    public ColorService colorService;
    @Autowired
    public SizeService sizeService;

    @GetMapping("/{productId}")
    public String product(Model model, 
                          @PathVariable String productId
                          ) throws Exception {
        Product product = productService.findById(productId);
        categoryService.listCategory(model);
        List<ImgProduct> imgProducts = imgProductService.findAllImgByProduct(productId);
        List<Color> colors = colorService.findColor(productId);
        List<Size> sizes = sizeService.findSize(productId);
        List<ProductDetail> productDetails = productDetailService.findAllByProductAndColor(productId,colors.get(0).getColorId());

        model.addAttribute("title","Home");
        model.addAttribute("product",product);
        model.addAttribute("imgProducts",imgProducts);
        model.addAttribute("colors",colors);
        model.addAttribute("sizes",sizes );
        model.addAttribute("productDetails",productDetails );
        return "web/Product";
    }

    @GetMapping("/detail")
    public String getDetail(Model model,
                            @RequestParam(value = "productId") String productId,
                            @RequestParam(value = "colorId") String colorId,
                            @RequestParam(value = "sizeId",defaultValue = "") String sizeId){
        Product product = productService.findById(productId);
        ProductDetail productDetail = productDetailService.findProductDetail(productId,colorId,sizeId);
        System.out.println(colorId);
        System.out.println(sizeId);
        System.out.println(productDetail);
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
