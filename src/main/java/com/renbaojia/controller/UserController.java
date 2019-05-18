package com.renbaojia.controller;

import com.renbaojia.pojo.User;
import com.renbaojia.service.IUserService;
import io.swagger.annotations.Api;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
@Api(tags = {"用户登录模块"})
@Controller
@RequestMapping("user")
public class UserController {
    @Autowired
    IUserService service;
    @ResponseBody
    @RequestMapping("/findAll")
    public List<User> findAll() {
        return service.findAll();
    }

}
