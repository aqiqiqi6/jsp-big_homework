package model;

public class UserBalances {
    private int userId;
    private double waterBalance;
    private double electricityBalance;

    public UserBalances(int userId, double waterBalance, double electricityBalance) {
        this.userId = userId;
        this.waterBalance = waterBalance;
        this.electricityBalance = electricityBalance;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public double getWaterBalance() {
        return waterBalance;
    }

    public void setWaterBalance(double waterBalance) {
        this.waterBalance = waterBalance;
    }

    public double getElectricityBalance() {
        return electricityBalance;
    }

    public void setElectricityBalance(double electricityBalance) {
        this.electricityBalance = electricityBalance;
    }
}
