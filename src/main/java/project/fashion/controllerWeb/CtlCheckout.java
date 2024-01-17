package project.fashion.controllerWeb;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import project.fashion.model.entity.CartItem;
import project.fashion.model.entity.Category;
import project.fashion.model.entity.Invoice;
import project.fashion.model.service.AccountService;
import project.fashion.model.service.CategoryService;

import java.util.List;

@Controller
@SessionAttributes
@RequestMapping("/checkout")
public class CtlCheckout {
    @Autowired
    private CategoryService categoryService;

//    @GetMapping("")
//    public String getCheckout(Model model){
//
//        return "web/Checkout";
//    }

    @GetMapping("")
    public String addInvoice(Model model, @ModelAttribute Invoice invoice){
        System.out.println(invoice);
//        List<CartItem> cartItemList = (List<CartItem>) model.getAttribute("CARTS");
//        for (CartItem cartItem: cartItemList){
//            cartItem.getPrice();
//        }
        return "web/Checkout";
    }

}
