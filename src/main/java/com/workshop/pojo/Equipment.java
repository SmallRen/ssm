package com.workshop.pojo;

import java.util.Date;

public class Equipment {

    private int equipmentId;

    private String enqipmentNumber;

    private int workshopId;

    private String model;

    private int userId;

    private String  orderDate;

    private String exfactoryDate;

    private User user;

    private Workshop workshop;


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

    public String getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(String orderDate) {
        this.orderDate = orderDate;
    }

    public String getExfactoryDate() {
        return exfactoryDate;
    }

    public void setExfactoryDate(String exfactoryDate) {
        this.exfactoryDate = exfactoryDate;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Workshop getWorkshop() {
        return workshop;
    }

    public void setWorkshop(Workshop workshop) {
        this.workshop = workshop;
    }
}
