package com.maze.project.web.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;
import java.math.BigDecimal;
import java.time.LocalDateTime;

/**
 * <p>
 * 
 * </p>
 *
 * @author maze
 * @since 2022-01-24
 */
@Getter
@Setter
@TableName("my_credit_card")
public class MyCreditCard implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId("id")
    private Integer id;

    /**
     * 银行名
     */
    @TableField("name")
    private String name;

    /**
     * 信用卡额度
     */
    @TableField("limit")
    private Integer limit;

    /**
     * 剩余额度
     */
    @TableField("left_amount")
    private BigDecimal leftAmount;

    /**
     * 账单日
     */
    @TableField("bill_date")
    private Integer billDate;

    /**
     * 最后还款日
     */
    @TableField("repayment_date")
    private Integer repaymentDate;

    @TableField("create_time")
    private LocalDateTime createTime;

    @TableField("update_time")
    private LocalDateTime updateTime;

}
