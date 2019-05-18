package com.renbaojia.service;

import com.renbaojia.pojo.User;

import java.util.List;

public interface IUserService {
    /**
     * 查找所有用户
     * @return
     */
    List<User> findAll();
}
