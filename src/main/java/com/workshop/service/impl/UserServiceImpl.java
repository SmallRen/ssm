package com.workshop.service.impl;

import com.workshop.dao.IUserDao;
import com.workshop.pojo.User;
import com.workshop.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements IUserService {
    @Autowired
    IUserDao userDao;

    @Override
    public List<User> findAll() {
        List<User> users = this.userDao.findAll();

        return users;

    }

    @Override
    public boolean delete(Long id) {
        int i=userDao.delete(id);
        return i == 1 ? true : false;
    }

    @Override
    public boolean update(User user) {
        int i=userDao.updateByPrimaryKeySelective(user);
        return i == 1 ? true : false;
    }

    @Override
    public boolean insert(User user) {
        int i=userDao.insert(user);
        return i == 1 ? true : false;
    }

}
