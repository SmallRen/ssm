package com.workshop.dao;

import com.workshop.pojo.Equipment;
import java.util.List;

public interface IEquipmentDao {

    List<Equipment> findAll();

    int delete(Integer equipmentId);

    int insert(Equipment equipment);

    int updateByPrimaryKeySelective(Equipment equipment);
    List<Equipment> findByAdmin();


    List<Equipment> findByWorkshopId(Long workshopId, Long role,Long userId);
}
