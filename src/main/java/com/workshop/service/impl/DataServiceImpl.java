package com.workshop.service.impl;

import com.workshop.dao.IDataDao;
import com.workshop.dao.IStateDao;
import com.workshop.pojo.Data;
import com.workshop.pojo.State;
import com.workshop.service.IDataService;
import com.workshop.service.IStateService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class DataServiceImpl implements IDataService {

    @Autowired
    IDataDao dao;

    @Override
    public List<Data> find(Date start, Date end) {
        return dao.find(start, end);
    }
}
