package com.workshop.controller;

import com.workshop.pojo.User;
import com.workshop.service.IRoleService;
import com.workshop.service.IUserService;
import com.workshop.service.IWorkshopService;
import io.swagger.annotations.Api;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Api(tags = {"用户模块"})
@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    IUserService service;

    @Autowired
    IRoleService roleService;

    @Autowired
    IWorkshopService workshopService;
    /**
     * 查询所有用户
     *
     * @param
     * @return
     */
    @ResponseBody
    @RequestMapping("/findAll")
    public List<User> findAll() {
        List<User> all = service.findAll();
        return all;
    }

    @RequestMapping("/checkUser")
    public ModelAndView checkUser(ModelAndView modelAndView) {
        modelAndView.addObject("list", service.findAll());
        modelAndView.addObject("roleList", roleService.findAll());
        modelAndView.addObject("workList", workshopService.findAll());
        modelAndView.setViewName("check_user");
        return modelAndView;
    }

//    @RequestMapping("/checkUser")
//    public String checkUser(HttpServletRequest request) {
//        request.setAttribute("list", service.findAll());
//        return "check_user";
//    }


    /**
     * 用户删除
     *
     * @param id
     * @return
     */
    @ResponseBody
    @RequestMapping("/delete")
    public boolean delete(Long id) {
        return service.delete(id);
    }

    /**
     * 修改用户
     *
     * @param user
     * @return
     */
    @ResponseBody
    @PostMapping("/update")
    public boolean update(User user) {
        return service.update(user);
    }

    @ResponseBody
    @RequestMapping("/insert")
    public boolean insert(User user) {
        return service.insert(user);
    }


}
