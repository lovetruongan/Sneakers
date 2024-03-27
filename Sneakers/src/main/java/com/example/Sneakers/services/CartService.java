package com.example.Sneakers.services;

import com.example.Sneakers.dtos.CartItemDTO;
import com.example.Sneakers.exceptions.DataNotFoundException;
import com.example.Sneakers.models.Cart;
import com.example.Sneakers.models.Product;
import com.example.Sneakers.models.User;
import com.example.Sneakers.repositories.CartRepository;
import com.example.Sneakers.repositories.ProductRepository;
import com.example.Sneakers.repositories.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@RequiredArgsConstructor
public class CartService implements ICartService{
    private final CartRepository cartRepository;
    private final ProductRepository productRepository;
    private final UserRepository userRepository;
    private final UserService userService;
    @Override
    @Transactional
    public Cart createCart(CartItemDTO cartItemDTO,String token) throws Exception {
        Product product = productRepository.findById(cartItemDTO.getProductId())
                .orElseThrow(() -> new DataNotFoundException(
                        "Cannot find product with id = " + cartItemDTO.getProductId()
                ));
        String extractedToken = token.substring(7); // Loại bỏ "Bearer " từ chuỗi token
        User user = userService.getUserDetailsFromToken(extractedToken);
        Cart cart = Cart.builder()
                .product(product)
                .quantity(cartItemDTO.getQuantity())
                .size(cartItemDTO.getSize())
                .user(user)
                .build();
        return cartRepository.save(cart);
    }

    @Override
    public List<Cart> getCartsByUserId(String token) throws Exception {
        String extractedToken = token.substring(7); // Loại bỏ "Bearer " từ chuỗi token
        User user = userService.getUserDetailsFromToken(extractedToken);
        return cartRepository.findByUserId(user.getId());
    }

    @Override
    @Transactional
    public Cart updateCart(Long id, CartItemDTO cartItemDTO) throws Exception {
        Cart cart = cartRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Cart not found"));
        Product product = productRepository.findById(cartItemDTO.getProductId())
                .orElseThrow(() -> new DataNotFoundException(
                        "Cannot find product with id = " + cartItemDTO.getProductId()
                ));
        cart.setProduct(product);
        cart.setQuantity(cartItemDTO.getQuantity());
        cart.setSize(cartItemDTO.getSize());
        return cartRepository.save(cart);
    }

    @Override
    @Transactional
    public void deleteCart(Long id) {
        cartRepository.deleteById(id);
    }

    @Override
    @Transactional
    public void deleteCartByUserId(String token) throws Exception {
        String extractedToken = token.substring(7); // Loại bỏ "Bearer " từ chuỗi token
        User user = userService.getUserDetailsFromToken(extractedToken);
        cartRepository.deleteByUserId(user.getId());
    }


}