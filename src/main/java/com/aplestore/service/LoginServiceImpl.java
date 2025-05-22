package com.aplestore.service;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.mybatis.spring.SqlSessionTemplate;

import com.aplestore.common.SHA256;
import com.aplestore.dao.LoginMapper;
import com.aplestore.dto.LoginDTO;

@Service
@RequiredArgsConstructor
public class LoginServiceImpl implements LoginService {

    private final SqlSessionTemplate sqlSession;
    private final SHA256 passwordEncoder;

    @Override
    public LoginDTO login(String userId, String userPwd) {

        String hashedPwd = passwordEncoder.encode(userPwd);

        LoginDTO param = new LoginDTO(userId, hashedPwd);

        return sqlSession.getMapper(LoginMapper.class).selectByCredentials(param);
    }
}
