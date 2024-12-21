package model;

import java.math.BigDecimal;

public class FeeStandard {
    private int id; // 收费标准ID
    private String name; // 收费项目名称
    private BigDecimal price; // 收费价格

    public FeeStandard() {}

    public FeeStandard(int id, String name, double price) {
        this.id = id;
        this.name = name;
        this.price = BigDecimal.valueOf(price);  // 将 double 转为 BigDecimal
    }

    // 新构造方法，接受 BigDecimal 类型
    public FeeStandard(int id, String name, BigDecimal price) {
        this.id = id;
        this.name = name;
        this.price = price;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    @Override
    public String toString() {
        return "FeeStandard{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", price=" + price +
                '}';
    }
}
