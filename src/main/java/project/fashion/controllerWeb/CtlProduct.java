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

    @GetMapping("/{productId}")
    public String product(Model model, 
                          @PathVariable String productId,
                          @RequestParam(value = "color",defaultValue = "") String color,
                          @RequestParam(value = "size",defaultValue = "") String size
                          ) throws Exception {
        Product product = productService.findById(productId);
        categoryService.listCategory(model);
        List<ImgProduct> imgProducts = imgProductService.findAllImgByProduct(productId);
        List<Color> colors = colorService.findColor(productId);
        System.out.println(colors);
        ProductDetail productDetail = productDetailService.findProductDetail(productId,"NV","S");

        model.addAttribute("title","Home");
        model.addAttribute("productDetail",productDetail);
        model.addAttribute("product",product);
        model.addAttribute("imgProducts",imgProducts);
        model.addAttribute("colors",colors);
        return "web/Product";
    }

    @GetMapping("/img")
    public ResponseEntity<Resource> getImg(@RequestParam("fileImg") String fileImg) throws MalformedURLException {
        return imgProductService.getImg(fileImg);
    }
}
