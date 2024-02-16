package com.example.Sneakers.repositories;


import com.example.Sneakers.models.Product;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ProductRepository extends JpaRepository<Product,Long> {
    Page<Product> findAll(Pageable pageable); //Phân trang

    boolean existsByName(String name);
}