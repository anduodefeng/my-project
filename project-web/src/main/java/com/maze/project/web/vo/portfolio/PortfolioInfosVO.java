package com.maze.project.web.vo.portfolio;

import lombok.Data;

import javax.validation.constraints.NotBlank;

@Data
public class PortfolioInfosVO {

    @NotBlank(message = "accountId不能为空")
    private String accountId;
}
