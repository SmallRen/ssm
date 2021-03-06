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

    boolean insert(Equipment equipment);

    boolean update(Equipment equipment);

    /**
     * 根据role 车间id 查询设备
     * @param workshopId
     * @param role
     * @return
     */
    List<Equipment> findByWorkshopId(Long workshopId, Long role,Long userId);
}
