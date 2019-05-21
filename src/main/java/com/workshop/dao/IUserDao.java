package com.workshop.dao;

import com.workshop.pojo.User;

import java.util.List;

public interface IUserDao {

    List<User> findAll();

    int delete(Long id);

    int updateByPrimaryKeySelective(User user);

    int insert(User user);


}