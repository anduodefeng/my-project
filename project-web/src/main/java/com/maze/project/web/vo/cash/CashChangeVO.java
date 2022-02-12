package com.maze.project.web.vo.cash;

import lombok.Data;

import javax.validation.constraints.NotBlank;

@Data
public class CashChangeVO {

    @NotBlank(message = "银行名称不能为空")
    private String bankName;
    @NotBlank(message = "变动金额不能为空")
    private String changeMoney;

    private String reason;
}
