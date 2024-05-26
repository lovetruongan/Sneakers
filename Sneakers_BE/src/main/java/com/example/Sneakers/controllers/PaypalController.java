package com.example.Sneakers.controllers;

import com.example.Sneakers.dtos.PayDTO;
import com.example.Sneakers.models.Cart;
import com.example.Sneakers.responses.CartResponse;
import com.example.Sneakers.responses.MessageResponse;
import com.example.Sneakers.responses.PaypalResponse;
import com.example.Sneakers.services.PaypalService;
import com.paypal.api.payments.Links;
import com.paypal.api.payments.Payment;
import com.paypal.base.rest.PayPalRESTException;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("${api.prefix}/paypal")
@RequiredArgsConstructor
public class PaypalController {
    private final PaypalService paypalService;

    @PostMapping("/pay")
    public ResponseEntity<?> payment(@RequestBody PayDTO payDTO) {
        try {
            String cancelUrl = "http://localhost:8089/api/v1/paypal/cancel";
            String successUrl = "http://localhost:8089/api/v1/paypal/success";

            Payment payment = paypalService.createPayment(payDTO.getPrice(), payDTO.getCurrency(), payDTO.getMethod(),
                    payDTO.getIntent(), payDTO.getDescription(),cancelUrl,successUrl);
            for(Links link:payment.getLinks()) {
                if(link.getRel().equals("approval_url")) {
                    return ResponseEntity.ok(PaypalResponse
                            .builder()
                            .approvalUrl(link.getHref())
                            .build());
                }
            }
        }
        catch (Exception e){
            return ResponseEntity.ok(MessageResponse.builder()
                    .message(e.getMessage())
                    .build());
        }
        return ResponseEntity.badRequest().body(MessageResponse.builder()
                .message("Pay unsuccessfully")
                .build());
    }
    @GetMapping("/cancel")
    public ResponseEntity<?> cancelPay() {
        // Xử lý khi người dùng hủy thanh toán
        return ResponseEntity.ok(MessageResponse.builder()
                .message("Payment cancelled")
                .build());
    }

    @GetMapping("/success")
    public ResponseEntity<?> successPay(@RequestParam("paymentId") String paymentId, @RequestParam("PayerID") String payerId) {
        // Xử lý khi thanh toán thành công
        try {
            Payment payment = paypalService.executePayment(paymentId, payerId);
            if (payment.getState().equals("approved")) {
                return ResponseEntity.ok(MessageResponse.builder()
                        .message("Payment successful")
                        .build());
            }
        } catch (Exception e) {
            return ResponseEntity.ok(MessageResponse.builder()
                    .message(e.getMessage())
                    .build());
        }
        return ResponseEntity.badRequest().body(MessageResponse.builder()
                .message("Payment failed")
                .build());
    }
}