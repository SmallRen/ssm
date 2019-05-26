package com.workshop.controller;


import com.workshop.pojo.Equipment;
import com.workshop.service.IEquipmentService;
import com.workshop.service.IUserService;
import com.workshop.service.IWorkshopService;
import io.swagger.annotations.Api;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Api(tags = {"设备模块"})
@Controller
@RequestMapping("/equipment")
public class EquipmentController {
    @Autowired
    IEquipmentService service;

    @Autowired
    IWorkshopService workshopService;

    @Autowired
    IUserService userService;

    /**
     * 查询所有用户
     *
     * @param
     * @return
     */
    @ResponseBody
    @GetMapping("/findAll")
    public List<Equipment> findAll() {
        return service.findAll();
    }


    /**
     * 查询所有设备
     *
     * @param
     * @return
     */
    @ResponseBody
    @GetMapping("/findByWorkshopId")
    public List<Equipment> findByWorkshopId(Long workshopId,Long role,Long userId) {
        return service.findByWorkshopId(workshopId,role,userId);
    }




    @GetMapping("/checkEquipment")
    public ModelAndView checkUser(ModelAndView modelAndView) {
        modelAndView.addObject("list", service.findAll());
        modelAndView.addObject("workList", workshopService.findAll());
        modelAndView.addObject("userlist", userService.findAll());
        modelAndView.setViewName("check_equipment");
        return modelAndView;
    }

//    @GetMapping("/checkUser")
//    public ModelAndView checkUser(ModelAndView modelAndView) {
//        modelAndView.addObject("list", service.findAll());
//        modelAndView.addObject("roleList", roleService.findAll());
//        modelAndView.addObject("workList", workshopService.findAll());
//        modelAndView.setViewName("check_user");
//        return modelAndView;
//    }

    /**
     * 设备删除
     *
     * @param equipmentId
     * @return
     */
    @ResponseBody
    @PostMapping("/delete")
    public boolean delete(Integer equipmentId) {
        return service.delete(equipmentId);
    }


    /**
     * 增加设备
     *
     * @param equipment
     * @return
     */
    @ResponseBody
    @PostMapping("/insert")
    public boolean insert(Equipment equipment) {
        return service.insert(equipment);
    }

    @ResponseBody
    @PostMapping("/update")
    public boolean update(Equipment equipment) {
        return service.update(equipment);
    }


}
