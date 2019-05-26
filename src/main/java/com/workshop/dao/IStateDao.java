package com.workshop.dao;

import com.workshop.pojo.State;

public interface IStateDao {

    State findOne(Long equipmentId);
}
