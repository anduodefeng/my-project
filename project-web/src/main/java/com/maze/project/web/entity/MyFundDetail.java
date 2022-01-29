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
 * 我的基金明细
 * </p>
 *
 * @author maze
 * @since 2021-12-18
 */
@Getter
@Setter
@TableName("my_fund_detail")
public class MyFundDetail implements Serializable {

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
     * 基金份额
     */
    @TableField("fund_shares")
    private BigDecimal fundShares;

    /**
     * 变动金额
     */
    @TableField("change_money")
    private BigDecimal changeMoney;

    /**
     * 基金净值
     */
    @TableField("fund_worth")
    private BigDecimal fundWorth;

    @TableField("create_time")
    private LocalDateTime createTime;

    /**
     * 备注
     */
    @TableField("remark")
    private String remark;

    /**
     * 类型 0-本金变动 1-资产更新
     */
    @TableField("type")
    private Integer type;

    @TableField("new_money")
    private BigDecimal newMoney;

    @TableField("profit_rate")
    private BigDecimal profitRate;
    /**
     * 本金
     */
    @TableField("principal")
    private BigDecimal principal;

}
