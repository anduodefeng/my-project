package com.maze.project.web.entity;

import com.baomidou.mybatisplus.annotation.IdType;
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
@TableName("my_credit_card_detail")
public class MyCreditCardDetail implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    /**
     * 信用卡
     */
    @TableField("credit_name")
    private String creditName;

    /**
     * 变动金额
     */
    @TableField("change_amount")
    private BigDecimal changeAmount;

    /**
     * 原因
     */
    @TableField("remark")
    private String remark;

    /**
     * 发生时间
     */
    @TableField("create_time")
    private LocalDateTime createTime;


}
