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
 * 现金表
 * </p>
 *
 * @author maze
 * @since 2021-12-18
 */
@Getter
@Setter
@TableName("my_cash")
public class MyCash implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    /**
     * 银行名称
     */
    @TableField("bank_name")
    private String bankName;

    /**
     * 现金
     */
    @TableField("cash")
    private BigDecimal cash;

    @TableField("create_time")
    private LocalDateTime createTime;


}
