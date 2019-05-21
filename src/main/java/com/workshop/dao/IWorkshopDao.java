package com.workshop.dao;

import com.workshop.pojo.Workshop;

import java.util.List;

public interface IWorkshopDao {

    List<Workshop> findAll();

    int insert(Workshop workshop);

    int delete(Integer workshopId);
}
