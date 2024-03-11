package com.example.Sneakers.services;

import com.example.Sneakers.dtos.UserDTO;
import com.example.Sneakers.exceptions.DataNotFoundException;
import com.example.Sneakers.models.User;

public interface IUserService {
    User createUser(UserDTO userDTO) throws Exception;
    String login(String phoneNumber, String password, Long roleId) throws Exception;
}