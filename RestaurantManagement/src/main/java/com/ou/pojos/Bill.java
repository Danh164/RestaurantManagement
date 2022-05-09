package com.ou.pojos;

import java.math.BigDecimal;
import javax.persistence.*;
import java.time.LocalDate;
import java.util.Date;

@Entity
@Table(name = "bill")
public class Bill {
    @Id
    @Column(name = "bill_id", nullable = false)
    private Integer id;

//    @MapsId
//    @OneToOne(fetch = FetchType.LAZY, optional = false)
//    @JoinColumn(name = "bill_id", nullable = false)
//    private Order order;

    @Column(name = "bill_created_date")
    private LocalDate billCreatedDate;

    @Column(name = "user_id")
    private Integer userId;

    @Column(name = "bill_total_money", length = 45)
    private BigDecimal billTotalMoney;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

//    public Order getOrder() {
//        return order;
//    }
//
//    public void setOrder(Order order) {
//        this.order = order;
//    }

    public LocalDate getBillCreatedDate() {
        return billCreatedDate;
    }

    public void setBillCreatedDate(LocalDate billCreatedDate) {
        this.billCreatedDate = billCreatedDate;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public BigDecimal getBillTotalMoney() {
        return billTotalMoney;
    }

    public void setBillTotalMoney(BigDecimal billTotalMoney) {
        this.billTotalMoney = billTotalMoney;
    }

}