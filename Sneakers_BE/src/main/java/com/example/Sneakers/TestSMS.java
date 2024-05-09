package com.example.Sneakers;

import com.twilio.Twilio;
import com.twilio.rest.api.v2010.account.Message;
import com.twilio.type.PhoneNumber;

public class TestSMS {
    // Find your Account Sid and Token at console.twilio.com
    public static final String ACCOUNT_SID = "AC83cd4dbe7b2c28833ac1a8ee9498b2f0";
    public static final String AUTH_TOKEN = "9ccdf6d015a6523627ffd54184b96555";

    public static void main(String[] args) {
        Twilio.init(ACCOUNT_SID, AUTH_TOKEN);

        Message message = Message
                .creator(
                        new PhoneNumber("0865247233"),
                        new PhoneNumber("+15017250604"),
                        "This is the ship that made the Kessel Run in fourteen parsecs?"
                )
                .create();

        System.out.println(message.getSid());
    }
}