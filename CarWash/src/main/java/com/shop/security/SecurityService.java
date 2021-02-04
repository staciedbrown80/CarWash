package com.shop.security;


public interface SecurityService {
    String findLoggedInUsername();
    void autoLogin(String email, String password);
}