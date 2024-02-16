package com.example.Sneakers.controllers;

import com.example.Sneakers.dtos.CategoryDTO;
import jakarta.validation.Valid;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RequestMapping("${api.prefix}/categories")
@RestController
public class CategoryController {
    @PostMapping("")
    public ResponseEntity<?> createCategory(
        @Valid @RequestBody CategoryDTO categoryDTO,
        BindingResult result
    ){
        if(result.hasErrors()){
            List<String> errorMessages = result.getFieldErrors().stream().map(FieldError::getDefaultMessage).toList();
            return ResponseEntity.badRequest().body(errorMessages);
        }
        return ResponseEntity.ok("Insert category successfully");
    }
    @GetMapping("")
    public ResponseEntity<?> getAllCategories(
        @RequestParam("page") int page,
        @RequestParam("limit") int limit
    ){
        return ResponseEntity.ok("List category");
    }
    @PutMapping("/{id}")
    public ResponseEntity<?> updateCategory(
            @Valid @PathVariable("id") Long id,
            @Valid @RequestBody CategoryDTO categoryDTO
    ){
        return ResponseEntity.ok("Update category with id = " + id + " successfully");
    }
    @DeleteMapping("/{id}")
    public ResponseEntity<?> deleteCategory(
            @Valid @PathVariable("id") Long id
    ){
        return ResponseEntity.ok("Delete category with id = " + id + " successfully");
    }
}
