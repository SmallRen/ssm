package com.workshop.service.impl;

import com.workshop.dao.IStateDao;
import com.workshop.pojo.State;
import com.workshop.service.IStateService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class StateServiceImpl implements IStateService {

  @Autowired
  IStateDao dao;
    @Override
    public State findOne(Long equipmentId) {
        return dao.findOne(equipmentId);
    }
}
