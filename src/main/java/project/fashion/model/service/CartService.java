package project.fashion.model.service;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import project.fashion.model.entity.CartItem;

import java.util.List;

@Service
public class CartService {
    public int getTotalPrice(List<CartItem> cartItemList){
        var price = 0;
        for (CartItem cartItem: cartItemList){
            int itemPrice;
            if (cartItem.getDiscountPrice() == null){
                itemPrice = cartItem.getPrice() * cartItem.getQuantity();
            }else
                itemPrice = cartItem.getDiscountPrice() * cartItem.getQuantity();

            price += itemPrice;
        }
        return price;
    }

    public void getShippingFee(Model model,int totalPrice){
        if (totalPrice < 500000 && totalPrice > 0){
            model.addAttribute("shippingFee",30000);
        }else
            model.addAttribute("shippingFee",0);
    }
}
