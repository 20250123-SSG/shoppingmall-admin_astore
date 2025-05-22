package com.aplestore.dao;

import com.aplestore.dto.LoginDTO;

public interface LoginMapper {
    /**
     * 아이디/비밀번호 검증
     * @param loginDTO id/pwd 담긴 DTO
     * @return 일치하는 회원 정보(LoginDTO) 또는 null
     */
    LoginDTO selectByCredentials(LoginDTO loginDTO);
}
