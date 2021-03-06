package com.maze.project.web.vo.common;

import lombok.Data;

import javax.validation.constraints.NotNull;

@Data
public class GetUserInfoVO {

    @NotNull(message = "name不能为空")
    private String name;
}
