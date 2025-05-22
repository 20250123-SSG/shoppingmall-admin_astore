package com.aplestore.service;

import com.aplestore.dao.LoginMapper;
import com.aplestore.dto.LoginDTO;
import lombok.RequiredArgsConstructor;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class LoginServiceImpl implements LoginService {

    private final SqlSessionTemplate sqlSession;

    @Override
    public LoginDTO login(String userId, String userPwd) {
        // DTO에 입력값 세팅
        LoginDTO param = new LoginDTO(userId, userPwd);
        // 매퍼 호출
        return sqlSession.getMapper(LoginMapper.class).selectByCredentials(param);
    }
}
