package com.maze.project.web.vo.credit_card;

import lombok.Data;

import javax.validation.constraints.NotBlank;

@Data
public class CreditCardChangeVO {

    @NotBlank(message = "银行名称不能为空")
    private String bankName;
    @NotBlank(message = "变动金额不能为空")
    private String changeMoney;
    @NotBlank(message = "原因不能为空")
    private String reason;
    @NotBlank(message = "limit不能为空")
    private String limit;
    @NotBlank(message = "billDay不能为空")
    private String billDay;
    @NotBlank(message = "repayDay不能为空")
    private String repayDay;
}
