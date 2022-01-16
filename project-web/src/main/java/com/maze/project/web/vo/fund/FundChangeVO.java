package com.maze.project.web.vo.fund;

import lombok.Data;

import javax.validation.constraints.NotBlank;

@Data
public class FundChangeVO {

    @NotBlank(message = "基金代码不能为空")
    private String code;
    @NotBlank(message = "基金名称不能为空")
    private String name;
    @NotBlank(message = "基金净值不能为空")
    private String worth;
    @NotBlank(message = "基金份额不能为空")
    private String shares;
    @NotBlank(message = "变动金额不能为空")
    private String  changeMoney;
    @NotBlank(message = "变动类型不能为空")
    private String type;
    @NotBlank(message = "基金类型不能为空")
    private String fundType;
    @NotBlank(message = "变动时间不能为空")
    private String createTime;

    private String remark;
}
