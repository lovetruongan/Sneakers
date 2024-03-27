package com.example.Sneakers.services;

import com.example.Sneakers.dtos.CartItemDTO;
import com.example.Sneakers.exceptions.DataNotFoundException;
import com.example.Sneakers.models.Cart;

import java.util.List;

public interface ICartService {
    Cart createCart(CartItemDTO cartItemDTO,String token) throws Exception;
    List<Cart> getCartsByUserId(String token) throws Exception;
    Cart updateCart(Long id, CartItemDTO cartItemDTO) throws Exception;
    void deleteCart(Long id);
    void deleteCartByUserId(String token) throws Exception;

}