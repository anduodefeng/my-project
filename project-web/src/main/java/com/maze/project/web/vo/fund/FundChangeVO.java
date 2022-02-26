package com.maze.project.web.vo.fund;

import lombok.Data;

import javax.validation.constraints.NotBlank;

@Data
public class FundChangeVO {

    @NotBlank(message = "基金代码不能为空")
    private String code;
    @NotBlank(message = "基金名称不能为空")
    private String name;
    @NotBlank(message = "变动金额不能为空")
    private String newMoney;
    @NotBlank(message = "基金类型不能为空")
    private String fundType;
    @NotBlank(message = "变动时间不能为空")
    private String createTime;
    @NotBlank(message = "收益不能为空")
    private String profit;
    private String profitRate;
}
