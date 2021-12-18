package com.maze.project.web.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import java.math.BigDecimal;
import java.time.LocalDateTime;
import lombok.Getter;
import lombok.Setter;

/**
 * <p>
 * 现金明细表
 * </p>
 *
 * @author maze
 * @since 2021-12-18
 */
@Getter
@Setter
@TableName("my_cash_detail")
public class MyCashDetail implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    /**
     * 银行id
     */
    @TableField("bank_id")
    private Integer bankId;

    /**
     * 银行名称
     */
    @TableField("bank_name")
    private String bankName;

    /**
     * 变动金额
     */
    @TableField("change_amount")
    private BigDecimal changeAmount;

    /**
     * 原因
     */
    @TableField("reason")
    private String reason;

    @TableField("create_time")
    private LocalDateTime createTime;


}
