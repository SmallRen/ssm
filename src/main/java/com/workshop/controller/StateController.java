package com.workshop.controller;

import com.workshop.common.ResponseCode;
import com.workshop.common.ResponseResult;
import com.workshop.service.IStateService;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/state")
public class StateController {
    @Autowired
    IStateService service;

    @ApiOperation(value = "查询能耗", notes = "查询能耗")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "equipmentId", value = "设备id", required = true, paramType = "query", dataType = "Long"),
    })
    @ResponseBody
    @PostMapping("/findone")
    public ResponseResult findOne(Long equipmentId) {
        return ResponseResult.e(ResponseCode.OK, service.findOne(equipmentId));
    }
}
