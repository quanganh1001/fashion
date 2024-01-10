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
import project.fashion.model.entity.Category;
import project.fashion.model.entity.ImgProduct;
import project.fashion.model.entity.Product;
import project.fashion.model.service.CategoryService;
import project.fashion.model.service.ImgProductService;
import project.fashion.model.service.ImgSizeService;
import project.fashion.model.service.ProductService;

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
    public ImgSizeService imgSizeService;
    @Autowired
    public ImgProductService imgProductService;

    @GetMapping("/{productId}")
    public String product(Model model, @PathVariable String productId){
        Product product = productService.findById(productId);
        categoryService.listCategory(model);
        List<ImgProduct> imgProducts = imgProductService.findAllImgByProduct(productId);

        model.addAttribute("title","Home");
        model.addAttribute("product",product);
        model.addAttribute("imgProducts",imgProducts);
        return "web/Product";
    }

    @GetMapping("/img")
    public ResponseEntity<Resource> getImg(@RequestParam("fileImg") String fileImg) throws MalformedURLException {
        return imgProductService.getImg(fileImg);
    }
}
