package com.workshop.pojo;

import java.util.Date;

public class Equipment {

    private int equipmentId;

    private String enqipmentNumber;

    private int workshopId;

    private String model;

    private int userId;

    private Date orderDate;

    private Date exfactoryDate;

    public int getEquipmentId() {
        return equipmentId;
    }

    public void setEquipmentId(int equipmentId) {
        this.equipmentId = equipmentId;
    }

    public String getEnqipmentNumber() {
        return enqipmentNumber;
    }

    public void setEnqipmentNumber(String enqipmentNumber) {
        this.enqipmentNumber = enqipmentNumber;
    }

    public int getWorkshopId() {
        return workshopId;
    }

    public void setWorkshopId(int workshopId) {
        this.workshopId = workshopId;
    }

    public String getModel() {
        return model;
    }

    public void setModel(String model) {
        this.model = model;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    public Date getExfactoryDate() {
        return exfactoryDate;
    }

    public void setExfactoryDate(Date exfactoryDate) {
        this.exfactoryDate = exfactoryDate;
    }
}
