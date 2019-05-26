package com.workshop.controller;

import com.workshop.common.ResponseCode;
import com.workshop.common.ResponseResult;
import com.workshop.dao.IDataDao;
import com.workshop.service.IDataService;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;

@Controller
@RequestMapping("/data")
public class DataController {


    @Autowired
    IDataService service;

    @ApiOperation(value = "根据日期范围查询数据", notes = "根据日期范围查询数据")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "start", value = "开始时间", required = true, paramType = "query", dataType = "Date"),
            @ApiImplicitParam(name = "end", value = "结束时间", required = true, paramType = "query", dataType = "Date"),
    })
    @ResponseBody
    @PostMapping("/find")
    public ResponseResult find(Date start, Date end) {
        return ResponseResult.e(ResponseCode.OK, service.find(start, end));
    }
}
