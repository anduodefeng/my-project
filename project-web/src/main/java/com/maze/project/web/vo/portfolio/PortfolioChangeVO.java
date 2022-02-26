package com.maze.project.web.vo.portfolio;

import lombok.Data;

import javax.validation.constraints.NotBlank;

@Data
public class PortfolioChangeVO {

    private String portfolioId;
    @NotBlank(message = "投顾组合不能为空")
    private String name;
    @NotBlank(message = "总金额不能为空")
    private String newMoney;
    @NotBlank(message = "accountId不能为空")
    private String accountId;
    @NotBlank(message = "accountName不能为空")
    private String accountName;
    @NotBlank(message = "收益不能为空")
    private String profit;
    private String profitRate;
    /**
     * 组合类型 0-稳健 1-积极  2-定投
     */
    @NotBlank(message = "type不能为空")
    private String type;

    @NotBlank(message = "变动时间不能为空")
    private String createTime;
}
