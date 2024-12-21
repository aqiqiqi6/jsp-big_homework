package model;

import java.math.BigDecimal;

public class Yonghu {
    private int id;
    private String username;
    private String password;
    private String name;
    private String buildingNumber;
    private String unitNumber;
    private String roomNumber;
    private String userType;
    private String carNumber;
    private String phoneNumber;

    private BigDecimal waterBalance;  // 水费余额
    private BigDecimal electricityBalance;  // 电费余额
    public Yonghu() {
    }

    public Yonghu(String username, String password) {
        this.username = username;
        this.password = password;
    }

    public BigDecimal getWaterBalance() {
        return waterBalance;
    }

    public void setWaterBalance(BigDecimal waterBalance) {
        this.waterBalance = waterBalance;
    }

    public BigDecimal getElectricityBalance() {
        return electricityBalance;
    }

    public void setElectricityBalance(BigDecimal electricityBalance) {
        this.electricityBalance = electricityBalance;
    }
// Getters and Setters

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getBuildingNumber() {
        return buildingNumber;
    }

    public void setBuildingNumber(String buildingNumber) {
        this.buildingNumber = buildingNumber;
    }

    public String getUnitNumber() {
        return unitNumber;
    }

    public void setUnitNumber(String unitNumber) {
        this.unitNumber = unitNumber;
    }

    public String getRoomNumber() {
        return roomNumber;
    }

    public void setRoomNumber(String roomNumber) {
        this.roomNumber = roomNumber;
    }

    public String getUserType() {
        return userType;
    }

    public void setUserType(String userType) {
        this.userType = userType;
    }

    public String getCarNumber() {
        return carNumber;
    }

    public void setCarNumber(String carNumber) {
        this.carNumber = carNumber;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }
}
