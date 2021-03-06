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
 * 组合变动明细
 * </p>
 *
 * @author maze
 * @since 2021-12-18
 */
@Getter
@Setter
@TableName("my_fund_portfolio_detail")
public class MyFundPortfolioDetail implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @TableField("fund_portfolio_id")
    private Integer fundPortfolioId;

    /**
     * 基金组合名称
     */
    @TableField("fund_portfolio_name")
    private String fundPortfolioName;

    /**
     * 新资产
     */
    @TableField("new_assets")
    private BigDecimal newAssets;

    /**
     * 收益
     */
    @TableField("profit")
    private BigDecimal profit;

    /**
     * 收益率
     */
    @TableField("profit_rate")
    private BigDecimal profitRate;

    /**
     * 本金
     */
    @TableField("principal")
    private BigDecimal principal;


    @TableField("create_time")
    private LocalDateTime createTime;
}
