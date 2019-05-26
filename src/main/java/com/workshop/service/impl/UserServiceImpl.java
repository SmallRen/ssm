package com.workshop.service.impl;

import com.workshop.dao.IUserDao;
import com.workshop.pojo.User;
import com.workshop.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

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
        int i = userDao.delete(id);
        return i == 1 ? true : false;
    }

    @Override
    public boolean update(User user) {
        int i = userDao.updateByPrimaryKeySelective(user);
        return i == 1 ? true : false;
    }

    @Override
    public boolean insert(User user) {
        int i = userDao.insert(user);
        return i == 1 ? true : false;
    }

    @Override
    public boolean update(Integer id, String password) {
        int i = userDao.update(id, password);
        return i == 1 ? true : false;
    }

    @Override
    public boolean updatetel(Integer id, String telephone) {
        int i = userDao.updatetel(id, telephone);
        return i == 1 ? true : false;
    }

    @Override
    public User login(String telephone, String password, String mac) {
        User user = userDao.checkTelephone(telephone);
        if (user != null) {
            if (user.getPassword() == null) {
                user.setPassword(password);
                user.setMac(mac);
                userDao.updateByPrimaryKeySelective(user);
                return user;
            } else {
                if(!StringUtils.isEmpty(user.getPassword())){
                    if (user.getPassword().equals(password)) {
                        if (user.getMac() != null && user.getMac().equals(mac)) {
                            return user;
                        } else {
                            user.setMac(mac);
                            userDao.updateByPrimaryKeySelective(user);
                            return user;
                        }
                    } else {
                        return null;
                    }
                }
                else{
                    user.setPassword(password);
                    user.setMac(mac);
                    userDao.updateByPrimaryKeySelective(user);
                    return user;
                }

            }
        }
        return null;
    }
    
}
