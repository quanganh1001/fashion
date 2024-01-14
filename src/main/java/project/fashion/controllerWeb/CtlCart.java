package project.fashion.controllerWeb;

import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/carts")
public class CtlCart {

    @PostMapping("/")
    public String addToCart(HttpSession session,
                            @RequestParam("prDetailId") String prDetailId,
                            @RequestParam("quantity") int quantity) {

        return "Product added to cart";
    }

}
