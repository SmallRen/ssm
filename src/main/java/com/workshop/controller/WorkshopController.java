package com.workshop.controller;


import com.workshop.pojo.Workshop;
import com.workshop.service.IWorkshopService;
import io.swagger.annotations.Api;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Api(tags = {"车间模块"})
@Controller
@RequestMapping("/workshop")
public class WorkshopController {
    @Autowired
    IWorkshopService service;

    @ResponseBody
    @RequestMapping("/findAll")
    public List<Workshop> findAll() {
        return service.findAll();
    }


    @RequestMapping("/checkWorkshop")
    public ModelAndView checkWorkshop(ModelAndView modelAndView) {
        modelAndView.addObject("list", service.findAll());
        modelAndView.setViewName("check_workshop");
        return modelAndView;
    }

    @ResponseBody
    @RequestMapping("/insert")
    public boolean insert(Workshop workshop) {
        return service.insert(workshop);
    }

    @ResponseBody
    @RequestMapping("/delete")
    public boolean delete(Integer workshopId) {
        return service.delete(workshopId);
    }
}
