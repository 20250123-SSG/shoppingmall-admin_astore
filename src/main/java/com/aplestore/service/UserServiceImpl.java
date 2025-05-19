package com.aplestore.service;

import com.aplestore.dao.UserMapper;
import com.aplestore.dto.UserDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

    @Override
    public List<UserDTO> getAllUsers() {
        return userMapper.getAllUsers();
    }

    @Override
    public UserDTO getUserById(int id) {
        return userMapper.getUserById(id);
    }

    @Override
    public void insertUser(UserDTO user) {
        userMapper.insertUser(user);
    }

    @Override
    public void updateUser(UserDTO user) {
        userMapper.updateUser(user);
    }

    @Override
    public void deleteUser(int id) {
        userMapper.deleteUser(id);
    }

    // 검색 기능
    @Override
    public List<UserDTO> searchUsers(String keyword, String status) {
        return userMapper.searchUsers(keyword, status);
    }

}
