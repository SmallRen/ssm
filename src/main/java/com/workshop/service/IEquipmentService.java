package com.workshop.service;

import com.workshop.pojo.Equipment;

import java.util.List;

public interface IEquipmentService {
    /**
     * 查找所有设备
     * @return
     */
    List<Equipment> findAll();

    boolean delete(Integer equipmentId);

}
