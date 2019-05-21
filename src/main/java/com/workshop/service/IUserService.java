package com.workshop.service;

import com.workshop.pojo.User;

import java.util.List;

public interface IUserService {
    /**
     * 查找所有用户
     * @return
     */
    List<User> findAll();

    boolean delete(Long id);

    boolean update(User user);

    boolean insert(User user);

}
