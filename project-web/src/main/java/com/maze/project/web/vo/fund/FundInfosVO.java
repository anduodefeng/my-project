package com.maze.project.web.vo.fund;

import lombok.Data;

import javax.validation.constraints.NotBlank;

@Data
public class FundInfosVO {

    @NotBlank(message = "基金类型不能为空")
    private String fundType;
}
