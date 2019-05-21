package com.workshop.dao;

import com.workshop.pojo.User;

import java.util.List;

public interface IUserDao {

    List<User> findAll();

    int delete(String name);

    int updateByPrimaryKeySelective(User user);

    int insert(User user);


}