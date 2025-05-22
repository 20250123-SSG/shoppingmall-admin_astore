package com.aplestore.service;

import lombok.RequiredArgsConstructor;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.aplestore.dao.LoginMapper;
import com.aplestore.dto.LoginDTO;

@Service
@RequiredArgsConstructor
public class LoginServiceImpl implements LoginService {

    private final SqlSessionTemplate sqlSession;

    @Override
    public LoginDTO login(String userId, String userPwd) {

        LoginDTO param = new LoginDTO(userId, userPwd);

        return sqlSession.getMapper(LoginMapper.class).selectByCredentials(param);
    }
}
