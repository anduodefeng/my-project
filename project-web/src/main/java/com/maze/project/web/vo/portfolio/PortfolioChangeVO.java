package com.maze.project.web.vo.portfolio;

import lombok.Data;

import javax.validation.constraints.NotBlank;

@Data
public class PortfolioChangeVO {

    private String portfolioId;
    @NotBlank(message = "投顾组合不能为空")
    private String name;
    @NotBlank(message = "变动金额不能为空")
    private String changeMoney;
    @NotBlank(message = "原因不能为空")
    private String reason;
    @NotBlank(message = "changeType不能为空")
    private String changeType;
    /**
     * 组合类型 0-稳健 1-积极  2-定投
     */
    @NotBlank(message = "type不能为空")
    private String type;
}