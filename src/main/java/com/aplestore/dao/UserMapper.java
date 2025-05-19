package com.aplestore.dao;

import com.aplestore.dto.UserDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface UserMapper {
    List<UserDTO> getAllUsers();
    UserDTO getUserById(int id);
    void insertUser(UserDTO user);
    void updateUser(UserDTO user);
    void deleteUser(int id);

    // 검색 기능 추가
    List<UserDTO> searchUsers(@Param("keyword") String keyword, @Param("status") String status);
}
