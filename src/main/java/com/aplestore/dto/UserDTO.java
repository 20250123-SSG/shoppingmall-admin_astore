package com.aplestore.dto;

import lombok.*;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
@Builder
public class UserDTO {
    private int pmuserId;
    private String userId;
    private String userPwd;
    private String userName;
}
