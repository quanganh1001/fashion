package project.fashion.model.service;

import project.fashion.model.entity.CartItem;

import java.util.Collection;

public interface CartService {

    void addCartItem(CartItem item);

    void remove(int id);

    CartItem update(int prDetailId, int quantity);

    void clear();

    Collection<CartItem> getAllItem();

    int getCount();
}
