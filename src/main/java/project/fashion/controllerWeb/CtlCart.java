package project.fashion.controllerWeb;

import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/carts")
public class CtlCart {

//    @PostMapping("/addToCart")
//    public String addToCart(@ModelAttribute item, HttpSession session) {
//        // Lấy giỏ hàng từ Session
//        List<String> cart = (List<String>) session.getAttribute("cart");
//
//        // Nếu giỏ hàng chưa được tạo, tạo mới
//        if (cart == null) {
//            cart = new ArrayList<>();
//            session.setAttribute("cart", cart);
//        }
//
//        // Thêm sản phẩm vào giỏ hàng
//        cart.add(item);
//
//        return "Product added to cart";
//    }

}
