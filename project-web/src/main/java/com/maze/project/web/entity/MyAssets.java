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
 * 资产
 * </p>
 *
 * @author maze
 * @since 2021-12-18
 */
@Getter
@Setter
@TableName("my_assets")
public class MyAssets implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    /**
     * 总资产
     */
    @TableField("total_assets")
    private BigDecimal totalAssets;

    /**
     * 现金
     */
    @TableField("cash")
    private BigDecimal cash;

    /**
     * 投资
     */
    @TableField("investment")
    private BigDecimal investment;

    /**
     * 创建时间
     */
    @TableField("create_time")
    private LocalDateTime createTime;


}
