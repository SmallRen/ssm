package com.workshop.service.impl;


import com.workshop.dao.IWorkshopDao;
import com.workshop.pojo.Workshop;
import com.workshop.service.IWorkshopService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class WorkshopServiceImpl implements IWorkshopService {

    @Autowired
    IWorkshopDao workshopDao;

    @Override
    public List<Workshop> findAll() {
        List<Workshop> workshops = this.workshopDao.findAll();
        return workshops;
    }

    @Override
    public boolean insert(Workshop workshop) {

        int i=workshopDao.insert(workshop);
        return i == 1 ? true : false;
    }

    @Override
    public boolean delete(Integer workshopId) {
        int i=workshopDao.delete(workshopId);
        return i == 1 ? true : false;
    }

}
