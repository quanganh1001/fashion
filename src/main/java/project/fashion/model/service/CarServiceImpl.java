package project.fashion.model.service;

import org.springframework.stereotype.Service;
import project.fashion.model.entity.CartItem;

import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

@Service
public class CarServiceImpl implements CartService{

    Map<Integer, CartItem> maps = new HashMap<>();

    @Override
    public void addCartItem(CartItem item){
        CartItem cartItem = maps.get(item.getProductDetailId());
        if(cartItem == null){
            maps.put(item.getProductDetailId(),item);
        }else {
            cartItem.setQuantity(cartItem.getQuantity() + item.getQuantity());
        }
    }
    @Override
    public void remove(int id){
        maps.remove(id);
    }
    @Override
    public CartItem update(int prDetailId, int quantity){
        CartItem cartItem = maps.get(prDetailId);
        cartItem.setQuantity(quantity);
        return cartItem;
    }
    @Override
    public void clear(){
        maps.clear();
    }
    @Override
    public Collection<CartItem> getAllItem(){
        return maps.values();
    }
    @Override
    public int getCount(){
        return maps.values().size();
    }
}
