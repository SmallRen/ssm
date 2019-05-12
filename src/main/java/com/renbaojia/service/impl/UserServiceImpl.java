package com.renbaojia.service.impl;

import com.renbaojia.dao.UserMapper;
import com.renbaojia.entity.User;
import com.renbaojia.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements IUserService {
    @Autowired
    UserMapper userMapper;
    @Override
    public List<User> findAll() {
        return userMapper.findAll();
    }
}
