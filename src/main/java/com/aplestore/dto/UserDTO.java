package com.aplestore.dto;

import java.time.LocalDateTime;
import lombok.*;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class UserDTO {
    private int id;
    private String userId;
    private String userPwd;
    private String userName;
    private String userPhone;
    private String userAddress;
    private String userMail;
    private int userPoint;
    private String userStatus;
    private LocalDateTime createdAt;
    private LocalDateTime modifiedAt;

}
