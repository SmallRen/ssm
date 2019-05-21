package com.workshop.service.impl;

import com.workshop.dao.IEquipmentDao;
import com.workshop.pojo.Equipment;
import com.workshop.service.IEquipmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class EquipmentServiceImpl implements IEquipmentService {

    @Autowired
    IEquipmentDao equipmentDao;

    @Override
    public List<Equipment> findAll() {
        List<Equipment> equipments = this.equipmentDao.findAll();
        return equipments;

    }

    @Override
    public boolean delete(Integer equipmentId) {
            int i=equipmentDao.delete(equipmentId);
            return i == 1 ? true : false;

    }


}

