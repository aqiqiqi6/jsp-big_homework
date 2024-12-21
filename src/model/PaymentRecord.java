package model;

import java.util.Date;

public class PaymentRecord {
    private int userId;
    private String itemName;
    private double quantity;
    private double totalAmount;

    private Date paymentTime;

    // 构造方法
    public PaymentRecord(int userId, String itemName, double quantity, double totalAmount) {
        this.userId = userId;
        this.itemName = itemName;
        this.quantity = quantity;
        this.totalAmount = totalAmount;
    }

    public PaymentRecord() {

    }

    // Getter 和 Setter
    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getItemName() {
        return itemName;
    }

    public void setItemName(String itemName) {
        this.itemName = itemName;
    }

    public double getQuantity() {
        return quantity;
    }

    public void setQuantity(double quantity) {
        this.quantity = quantity;
    }

    public double getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(double totalAmount) {
        this.totalAmount = totalAmount;
    }

    public Date getPaymentTime() {
        return paymentTime;
    }

    public void setPaymentTime(Date paymentTime) {
        this.paymentTime = paymentTime;
    }
}
