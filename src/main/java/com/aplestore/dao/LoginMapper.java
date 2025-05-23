package com.aplestore.dao;

import com.aplestore.dto.LoginDTO;

public interface LoginMapper {
    LoginDTO selectByCredentials(LoginDTO loginDTO);
}
