package com.example.Sneakers.responses;

import com.example.Sneakers.models.Category;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.*;

import java.util.List;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class UpdateCategoryResponse {
    @JsonProperty("categories")
    private List<Category> categories;

    @JsonProperty("message")
    private String message;
}