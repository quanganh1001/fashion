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
import java.util.Objects;

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
    public String addToCart(@RequestParam("prDetailId") Integer prDetailId,
                            @RequestParam("quantity") int quantity,
                            @ModelAttribute("CARTS") List<CartItem> cartItemList) {
        ProductDetail productDetail = productDetailService.getById(prDetailId);
        Product product = productService.findById(productDetail.getProduct().getProductId());

        boolean itemExists = false;
        for (CartItem cartItem : cartItemList) {
            if (cartItem.getCode().equals(productDetail.getCode())) {
                cartItem.setQuantity(cartItem.getQuantity() + quantity);
                itemExists = true;
                break;
            }
        }

        if (!itemExists) {
            CartItem cartItem = new CartItem(
                    productDetail.getCode(),
                    product.getProductId(),
                    quantity,
                    product.getPrice(),
                    product.getDiscountPrice(),
                    product.getProductName(),
                    productDetail.getColor().getName(),
                    productDetail.getSize().getName()
            );
            cartItemList.add(cartItem);
        }

        return "redirect:/carts";
    }

    @GetMapping("/delete")
    public String delete(@RequestParam("prDetailCode") String prDetailCode,
                         @ModelAttribute("CARTS") List<CartItem> cartItemList){
        cartItemList.removeIf(cartItem -> Objects.equals(prDetailCode, cartItem.getCode()));
        return "redirect:/carts";
    }

    @GetMapping("/update")
    public String update(@RequestParam("prDetailCode") String prDetailCode,
                         @RequestParam("quantity") int quantity,
                         @ModelAttribute("CARTS") List<CartItem> cartItemList
                         ){
        for (CartItem cartItem: cartItemList){
            if(Objects.equals(cartItem.getCode(), prDetailCode)){
                cartItem.setQuantity(quantity);
            }
        }
        return "redirect:/carts";
    }

    @GetMapping("/totalInvoice")
    public String Info(Model model,@ModelAttribute("CARTS") List<CartItem> cartItemList) {
        var totalPrice = cartService.getTotalPrice(cartItemList);
        cartService.getShippingFee(model,totalPrice);

        model.addAttribute("totalPrice",totalPrice);
        return "web/component/InfoCart";
    }

}


