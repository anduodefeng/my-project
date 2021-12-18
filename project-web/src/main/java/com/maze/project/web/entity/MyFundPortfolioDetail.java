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
     * 变动金额
     */
    @TableField("change_money")
    private BigDecimal changeMoney;

    /**
     * 原资产
     */
    @TableField("old_assets")
    private BigDecimal oldAssets;

    /**
     * 新资产
     */
    @TableField("new_assets")
    private BigDecimal newAssets;

    @TableField("create_time")
    private LocalDateTime createTime;

    /**
     * 备注
     */
    @TableField("remark")
    private String remark;


}
