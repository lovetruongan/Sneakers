package com.example.Sneakers.dtos;

import lombok.*;

@Data
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class PayDTO {
    private Double price;
    private String currency;
    private String method;
    private String intent;
    private String description;
}