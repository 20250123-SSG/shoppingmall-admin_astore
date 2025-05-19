package com.aplestore.service;

import com.aplestore.dto.UserDTO;

import java.util.List;

public interface UserService {
    List<UserDTO> getAllUsers();
    UserDTO getUserById(int id);
    void insertUser(UserDTO user);
    void updateUser(UserDTO user);
    void deleteUser(int id);

    // 검색 기능
    List<UserDTO> searchUsers(String keyword, String status);

}
