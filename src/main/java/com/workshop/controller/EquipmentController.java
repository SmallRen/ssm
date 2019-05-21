package com.workshop.controller;


import com.workshop.pojo.Equipment;
import com.workshop.service.IEquipmentService;
import io.swagger.annotations.Api;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Api(tags = {"设备模块"})
@Controller
@RequestMapping("/equipment")
public class EquipmentController {
    @Autowired
    IEquipmentService service;
    /**
     * 查询所有用户
     * @param
     * @return
     */
    @ResponseBody
    @RequestMapping("/findAll")
    public List<Equipment> findAll() {
        return service.findAll();
    }

    @RequestMapping("/checkEquipment")
    public ModelAndView checkUser(ModelAndView modelAndView) {
        modelAndView.addObject("list", service.findAll());
        modelAndView.setViewName("check_equipment");
        return modelAndView;
    }
    /**
     * 设备删除
     * @param equipmentId
     * @return
     */
    @ResponseBody
    @RequestMapping("/delete")
    public boolean delete(Integer equipmentId) {
        return service.delete(equipmentId);
    }


}
