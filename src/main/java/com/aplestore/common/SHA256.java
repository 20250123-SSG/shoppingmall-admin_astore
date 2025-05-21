package com.aplestore.common;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

@Component
public class SHA256 {

    @Value("${security.password.salt}")
    private String salt;

    public String encode(String raw) {
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            String input = raw + salt;
            md.update(input.getBytes());
            return String.format("%064x", new BigInteger(1, md.digest()));
        } catch (NoSuchAlgorithmException e) {
            throw new IllegalStateException("SHA-256 알고리즘을 찾을 수 없습니다.", e);
        }
    }
}
