package project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import project.DTO.CartItem;
import project.model.Product;
import project.model.ProductDetail;

import java.util.List;
import java.util.Objects;

@Service
public class CartService {
    @Autowired
    private ProductService productService;
    @Autowired
    private ProductDetailService productDetailService;
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

    public int getShippingFee(int totalPrice){
        var shippingFee =0;
        if (totalPrice < 500000 && totalPrice > 0){
            shippingFee = 30000;

        }else{
            shippingFee = 0;
        }
        return shippingFee;

    }

    public void addCart(int prDetailId,List<CartItem> cartItemList,int quantity){
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
                    productDetail.getSize(),
                    productDetail.getProduct().getImageBackground()
            );
            cartItemList.add(cartItem);
        }
    }

    public void setQuantity(int quantity,List<CartItem> cartItemList,String prDetailCode){
        for (CartItem cartItem: cartItemList){
            if(Objects.equals(cartItem.getCode(), prDetailCode)){
                cartItem.setQuantity(quantity);
                break;
            }
        }
    }
}
