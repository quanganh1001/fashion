package project.controllerWeb;

import com.fasterxml.jackson.core.JsonProcessingException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import project.DTO.CartItem;
import project.model.Invoice;
import project.service.AccountService;
import project.service.CartService;
import project.service.Category.CategoryService;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

@Controller
@SessionAttributes("CARTS")
@RequestMapping("/carts")
public class CtlCart {
    @Autowired
    private AccountService accountService;
    @Autowired
    private CategoryService categoryService;
    @Autowired
    private CartService cartService;

    @ModelAttribute("CARTS")
    public List<CartItem> initializeCart() {
        return new ArrayList<>();
    }

    @GetMapping("")
    public String Cart(Model model,@ModelAttribute("CARTS") List<CartItem> cartItemList) throws JsonProcessingException {
        accountService.getAccountResponse(model);
        categoryService.listCategoryHeader(model);
        cartService.getTotalQuantityInCart(model);

        var totalPrice = cartService.getTotalPrice(cartItemList);
        var shippingFee = cartService.getShippingFee(totalPrice);


        model.addAttribute("newInvoice",new Invoice());
        model.addAttribute("shippingFee",shippingFee);
        model.addAttribute("totalPrice",totalPrice);
        model.addAttribute("title","Giỏ hàng");
        return "web/Cart";
    }

    @GetMapping("/addToCart")
    public String addToCart(Model model,
                            @RequestParam("prDetailId") Integer prDetailId,
                            @RequestParam("quantity") int quantity,
                            @ModelAttribute("CARTS") List<CartItem> cartItemList) throws JsonProcessingException {
        cartService.addCart(prDetailId, cartItemList, quantity);
        accountService.getAccountResponse(model);
        categoryService.listCategoryHeader(model);
        cartService.getTotalQuantityInCart(model);

        model.addAttribute("alertMessage","Thêm giỏ hàng thành công");
        return "web/component/header";
    }

    @GetMapping("/delete")
    public String delete(@RequestParam("prDetailCode") String prDetailCode,
                         @ModelAttribute("CARTS") List<CartItem> cartItemList){
        cartItemList.removeIf(cartItem -> Objects.equals(prDetailCode, cartItem.getCode()));
        return "redirect:/carts";
    }

    @GetMapping("/update")
    public String update(Model model,
                         @RequestParam("prDetailCode") String prDetailCode,
                         @RequestParam("quantity") int quantity,
                         @ModelAttribute("CARTS") List<CartItem> cartItemList
                         ){
        cartService.setQuantity(quantity,cartItemList,prDetailCode);

        var totalPrice = cartService.getTotalPrice(cartItemList);
        var shippingFee = cartService.getShippingFee(totalPrice);

        model.addAttribute("totalPrice",totalPrice);
        model.addAttribute("shippingFee",shippingFee);
        return "web/component/InfoCart";
    }


}


