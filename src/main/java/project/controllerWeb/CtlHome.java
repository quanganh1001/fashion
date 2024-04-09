package project.controllerWeb;

import com.fasterxml.jackson.core.JsonProcessingException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import project.model.Category.Category;
import project.model.Product.Product;
import project.service.*;
import project.service.Category.CategoryService;
import project.service.Product.ProductService;

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
    @Autowired
    private AccountService accountService;
    @Autowired
    private CartService cartService;

    @GetMapping("")
    public String getHome(Model model) throws JsonProcessingException {
        accountService.getAccountResponse(model);
        categoryService.listCategoryHeader(model);
        cartService.getTotalQuantityInCart(model);
        List<Category> categoryF2 = categoryService.getCategoryF2();
        List<Product> productSale = productService.findProductByIsDiscountTrue();

        model.addAttribute("productSale",productSale);
        model.addAttribute("banner",bannerService.getAllBanner());
        model.addAttribute("categoryF2",categoryF2);
        model.addAttribute("title","Trang chủ");
        return "web/Home";
    }

}
