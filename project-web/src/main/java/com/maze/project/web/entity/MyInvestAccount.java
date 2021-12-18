package com.maze.project.web.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Getter;
import lombok.Setter;

import java.io.Serial;
import java.io.Serializable;
import java.math.BigDecimal;
import java.time.LocalDateTime;

/**
 * <p>
 * 投资账户表
 * </p>
 *
 * @author maze
 * @since 2021-12-18
 */
@Getter
@Setter
@TableName("my_invest_account")
public class MyInvestAccount implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    /**
     * 账户名称
     */
    @TableField("name")
    private String name;

    /**
     * 账户总资产
     */
    @TableField("total_money")
    private BigDecimal totalMoney;

    @TableField("update_time")
    private LocalDateTime updateTime;

    @TableField("create_time")
    private LocalDateTime createTime;


}
