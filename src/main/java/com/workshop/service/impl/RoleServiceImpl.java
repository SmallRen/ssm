package com.workshop.service.impl;

import com.workshop.dao.IRoleDao;
import com.workshop.pojo.Role;
import com.workshop.service.IRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Author: renbaojia
 * @CreateDate: 2019-05-21 22:57:22
 * @Description: TODO
 * @Version: 3.6.0
 */
@Service
public class RoleServiceImpl implements IRoleService {
    @Autowired
    IRoleDao dao;

    @Override
    public List<Role> findAll() {
        return dao.findAll();
    }
}
