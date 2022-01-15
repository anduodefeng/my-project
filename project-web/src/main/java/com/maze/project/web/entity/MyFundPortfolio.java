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
 * 基金组合表
 * </p>
 *
 * @author maze
 * @since 2021-12-18
 */
@Getter
@Setter
@TableName("my_fund_portfolio")
public class MyFundPortfolio implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    /**
     * 组合名称
     */
    @TableField("name")
    private String name;

    /**
     * 价值
     */
    @TableField("money")
    private BigDecimal money;

    /**
     * 账户id
     */
    @TableField("account_id")
    private Integer accountId;

    @TableField("create_time")
    private LocalDateTime createTime;

    @TableField("update_time")
    private LocalDateTime updateTime;

    /**
     * 账户名称
     */
    @TableField("account_name")
    private String accountName;
    /**
     * 本金
     */
    @TableField("principal")
    private BigDecimal principal;
    /**
     * 盈利
     */
    @TableField("profit")
    private BigDecimal profit;

    /**
     * 类型 0-稳健 1-积极 2-定投
     */
    @TableField("type")
    private Integer type;

    /**
     * 收益率
     */
    @TableField("profit_rate")
    private BigDecimal profitRate;


}
