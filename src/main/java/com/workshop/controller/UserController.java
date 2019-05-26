package com.workshop.controller;

import com.workshop.common.ResponseCode;
import com.workshop.common.ResponseResult;
import com.workshop.pojo.User;
import com.workshop.service.IRoleService;
import com.workshop.service.IUserService;
import com.workshop.service.IWorkshopService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
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
    @GetMapping("/findAll")
    public List<User> findAll() {
        List<User> all = service.findAll();
        return all;
    }

    @GetMapping("/checkUser")
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
    @PostMapping("/delete")
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
    @PostMapping("/insert")
    public boolean insert(User user) {
        return service.insert(user);
    }


    /**
     * 修改用户密码
     *
     * @param
     * @return
     */
    @ApiOperation(value = "修改用户密码", notes = "修改用户密码")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "id", value = "用户名", required = true, paramType = "query", dataType = "String"),
            @ApiImplicitParam(name = "password", value = "用户密码", required = true, paramType = "query", dataType = "String"),
    })

    @PostMapping("/updatePassword")
    @ResponseBody
    public ResponseResult<Boolean> updatePassword(Integer id, String password) {

        return ResponseResult.e(ResponseCode.OK, service.update(id, password));
    }


    @ApiOperation(value = "修改用户密码", notes = "修改用户电话")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "id", value = "用户名", required = true, paramType = "query", dataType = "String"),
            @ApiImplicitParam(name = "telephone", value = "用户电话", required = true, paramType = "query", dataType = "String"),
    })

    @PostMapping("/updateTelephone")
    @ResponseBody
    public ResponseResult<Boolean> updateTelephone(Integer id, String telephone) {

        return ResponseResult.e(ResponseCode.OK, service.updatetel(id, telephone));
    }

    @ApiOperation(value = "登录", notes = "登录")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "telephone", value = "用户名", required = true, paramType = "query", dataType = "String"),
            @ApiImplicitParam(name = "password", value = "密码", required = true, paramType = "query", dataType = "String"),
            @ApiImplicitParam(name = "mac", value = "MAC地址", required = true, paramType = "query", dataType = "String"),
    })
    @ResponseBody
    @PostMapping("/login")
    public ResponseResult login(String telephone, String password, String mac) {
        User user = service.login(telephone, password, mac);
        if (user == null) {
            return ResponseResult.e(ResponseCode.FAIL, "登录失败！");
        }
        return ResponseResult.e(ResponseCode.OK, user);
    }

}
