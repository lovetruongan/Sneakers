package com.example.Sneakers.controllers;

import com.example.Sneakers.dtos.CartItemDTO;
import com.example.Sneakers.dtos.CategoryDTO;
import com.example.Sneakers.dtos.ProductDTO;
import com.example.Sneakers.models.Cart;
import com.example.Sneakers.models.Category;
import com.example.Sneakers.models.Product;
import com.example.Sneakers.models.User;
import com.example.Sneakers.responses.CategoryResponse;
import com.example.Sneakers.responses.ProductResponse;
import com.example.Sneakers.services.ICartService;
import com.example.Sneakers.services.IUserService;
import com.example.Sneakers.utils.MessageKeys;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("${api.prefix}/carts")
@RequiredArgsConstructor
public class CartController {
    private final ICartService cartService;
    @PostMapping("")
    public ResponseEntity<?> createCart(
            @Valid @RequestBody CartItemDTO cartItemDTO,
            @RequestHeader("Authorization") String token
    ) throws Exception {
        try {
            Cart cart = cartService.createCart(cartItemDTO,token);
            return ResponseEntity.ok(cart);
        }
        catch (Exception e){
            return ResponseEntity.badRequest().build();
        }
    }
    @GetMapping("")
    public ResponseEntity<?> getCartByUserId(
            @RequestHeader("Authorization") String token
    ){
        try {
            List<Cart> carts = cartService.getCartsByUserId(token);
            return ResponseEntity.ok(carts);
        } catch (Exception e) {
            return ResponseEntity.badRequest().body(e.getMessage());
        }
    }
    @PutMapping("/{id}")
    public ResponseEntity<?> updateCart(
            @PathVariable Long id,
            @RequestBody CartItemDTO cartItemDTO){
        try {
            Cart updatedCart = cartService.updateCart(id,cartItemDTO);
            return ResponseEntity.ok(updatedCart);
        } catch (Exception e) {
            return ResponseEntity.badRequest().body(e.getMessage());
        }
    }
    @DeleteMapping("/{id}")
    public ResponseEntity<?> deleteCart(
            @Valid @PathVariable("id") Long id
    ){
        try {
            cartService.deleteCart(id);
            return ResponseEntity.ok("Cart deleted successfully");
        } catch (Exception e) {
            return ResponseEntity.badRequest().body(e.getMessage());
        }
    }

    @DeleteMapping("")
    public ResponseEntity<?> deleteCartByUserId(
            @RequestHeader("Authorization") String token
    ){
        try {
            cartService.deleteCartByUserId(token);
            return ResponseEntity.ok("Cart deleted successfully");
        } catch (Exception e) {
            return ResponseEntity.badRequest().body(e.getMessage());
        }
    }
}