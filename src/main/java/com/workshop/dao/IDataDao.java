package com.workshop.dao;

import com.workshop.pojo.Data;
import com.workshop.pojo.State;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

public interface IDataDao {

    List<Data> find(@Param("start") Date start, @Param("end") Date end);
}
