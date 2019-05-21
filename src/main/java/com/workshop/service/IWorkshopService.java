package com.workshop.service;

import com.workshop.pojo.Workshop;

import java.util.List;

public interface IWorkshopService {

    List<Workshop> findAll();

    boolean insert(Workshop workshop);

    boolean delete(Integer workshopId);


}
