package com.renbaojia.dao;

import com.renbaojia.entity.User;

import java.util.List;

public interface UserMapper {
    List<User> findAll();

}