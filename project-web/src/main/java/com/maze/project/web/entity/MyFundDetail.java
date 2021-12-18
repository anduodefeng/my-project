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
     * 基金净值
     */
    @TableField("fund_shares")
    private BigDecimal fundShares;

    /**
     * 变动金额
     */
    @TableField("change_money")
    private BigDecimal changeMoney;

    /**
     * 旧基金价值
     */
    @TableField("old_fund_money")
    private BigDecimal oldFundMoney;

    /**
     * 新基金价值
     */
    @TableField("new_fund_money")
    private BigDecimal newFundMoney;

    @TableField("create_time")
    private LocalDateTime createTime;

    /**
     * 备注
     */
    @TableField("remark")
    private String remark;


}
