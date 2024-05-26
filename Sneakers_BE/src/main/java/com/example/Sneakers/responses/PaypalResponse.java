package com.example.Sneakers.responses;

import lombok.*;

@Data
@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class PaypalResponse {
    private String message;
    private String approvalUrl;
}