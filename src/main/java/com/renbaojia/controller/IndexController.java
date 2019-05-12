package com.renbaojia.controller;

import com.renbaojia.entity.User;
import com.renbaojia.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/")
public class IndexController {
    @Autowired
    IUserService service;

    @RequestMapping("/")
    public String index() {
        return "index";
    }

    @ResponseBody
    @RequestMapping("/findAll")
    public List<User> findAll() {
        return service.findAll();
    }

}
