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
 * 我的基金
 * </p>
 *
 * @author maze
 * @since 2021-12-18
 */
@Getter
@Setter
@TableName("my_fund")
public class MyFund implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    /**
     * 基金代码
     */
    @TableField("fund_code")
    private String fundCode;

    /**
     * 基金名称
     */
    @TableField("fund_name")
    private String fundName;

    /**
     * 基金净值
     */
    @TableField("fund_net_worth")
    private BigDecimal fundNetWorth;

    /**
     * 基金份额
     */
    @TableField("fund_shares")
    private BigDecimal fundShares;

    /**
     * 基金价值
     */
    @TableField("fund_money")
    private BigDecimal fundMoney;

    /**
     * 账户id
     */
    @TableField("account_id")
    private Integer accountId;

    /**
     * 账户名称
     */
    @TableField("account_name")
    private String accountName;

    @TableField("create_time")
    private LocalDateTime createTime;

    @TableField("update_time")
    private LocalDateTime updateTime;

    /**
     * 本金
     */
    @TableField("principal")
    private BigDecimal principal;

    /**
     * 类型 0-指数基金 1-主动基金
     */
    @TableField("type")
    private Integer type;

    /**
     * 盈利
     */
    @TableField("profit")
    private BigDecimal profit;

}
