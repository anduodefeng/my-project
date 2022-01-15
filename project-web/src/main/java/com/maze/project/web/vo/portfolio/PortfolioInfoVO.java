package com.maze.project.web.vo.portfolio;

import lombok.Data;

import javax.validation.constraints.NotBlank;

@Data
public class PortfolioInfoVO {

    @NotBlank(message = "id不能为空")
    private String id;
}
