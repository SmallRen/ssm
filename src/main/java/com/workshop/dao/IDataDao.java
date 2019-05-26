package com.workshop.dao;

import com.workshop.pojo.Data;
import com.workshop.pojo.State;

import java.util.Date;
import java.util.List;

public interface IDataDao {

    List<Data> find(Date start, Date end);
}
