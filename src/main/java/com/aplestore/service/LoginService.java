package com.aplestore.service;

import com.aplestore.dto.LoginDTO;

public interface LoginService {
    LoginDTO login(String userId, String userPwd);
}
