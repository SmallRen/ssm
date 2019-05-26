package com.workshop.dao;

import com.workshop.pojo.Equipment;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface IEquipmentDao {

    List<Equipment> findAll();

    int delete(Integer equipmentId);

    int insert(Equipment equipment);

    int updateByPrimaryKeySelective(Equipment equipment);
    List<Equipment> findByAdmin();


    List<Equipment> findByWorkshopId(@Param("workshopId")Long workshopId, @Param("role") Long role, @Param("userId")Long userId);
}
