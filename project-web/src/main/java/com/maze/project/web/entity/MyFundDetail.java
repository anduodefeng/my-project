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
     * 新资产
     */
    @TableField("new_money")
    private BigDecimal newMoney;

    /**
     * 本金
     */
    @TableField("profit_rate")
    private BigDecimal profitRate;
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
     * 创建时间
     */
    @TableField("create_time")
    private LocalDateTime createTime;

}
