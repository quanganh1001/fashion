package project.fashion.controllerWeb;

import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import project.fashion.model.entity.CartItem;
import project.fashion.model.entity.ImgProduct;
import project.fashion.model.entity.Product;
import project.fashion.model.entity.ProductDetail;
import project.fashion.model.repository.ProductDetailRepo;
import project.fashion.model.service.*;

import java.net.MalformedURLException;
import java.util.ArrayList;
import java.util.List;

@Controller
@SessionAttributes("CARTS")
@RequestMapping("/carts")
public class CtlCart {

    @Autowired
    private CategoryService categoryService;
    @Autowired
    private ProductService productService;
    @Autowired
    private ProductDetailService productDetailService;
    @Autowired
    private CartService cartService;
    @ModelAttribute("CARTS")
    public List<CartItem> initializeCart() {
        return new ArrayList<>();
    }

    @GetMapping("")
    public String Cart(Model model,@ModelAttribute("CARTS") List<CartItem> cartItemList) {
        categoryService.listCategory(model);
        var totalPrice = cartService.getTotalPrice(cartItemList);
        cartService.getShippingFee(model,totalPrice);

        model.addAttribute("totalPrice",totalPrice);
        return "web/Cart";
    }

    @GetMapping("/addToCart")
    public String addToCart(Model model,
                            @RequestParam("prDetailId") Integer prDetailId,
                            @RequestParam("quantity") int quantity,
                            @ModelAttribute("CARTS") List<CartItem> cartItemList) {
        ProductDetail productDetail = productDetailService.getById(prDetailId);
        Product product = productService.findById(productDetail.getProduct().getProductId());

        CartItem cartItem = new CartItem
                        (productDetail.getCode(),
                        product.getProductId(),
                        quantity,
                        product.getPrice(),
                        product.getDiscountPrice(),
                        product.getProductName(),
                        productDetail.getColor().getName(),
                        productDetail.getSize().getName()
                        );

        cartItemList.add(cartItem);

        return "redirect:/carts";
    }
}


