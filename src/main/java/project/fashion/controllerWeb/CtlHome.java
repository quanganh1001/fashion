package project.fashion.controllerWeb;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import project.fashion.model.entity.Category;
import project.fashion.model.entity.ImgProduct;
import project.fashion.model.entity.Product;
import project.fashion.model.service.*;

import java.util.List;

@Controller
@SessionAttributes("CARTS")
@RequestMapping("")
public class CtlHome {
    @Autowired
    private CategoryService categoryService;
    @Autowired
    private BannerService bannerService;
    @Autowired
    private ProductService productService;


    @GetMapping("")
    public String getHome(Model model){
        categoryService.listCategory(model);
        List<Category> categoryF2 = categoryService.getCategoryF2();
        List<Product> productSale = productService.findProductByIsDiscountTrue();

        model.addAttribute("productSale",productSale);
        model.addAttribute("banner",bannerService.getAllBanner());
        model.addAttribute("categoryF2",categoryF2);
        model.addAttribute("title","Trang chủ");
        return "web/Home";
    }

}
