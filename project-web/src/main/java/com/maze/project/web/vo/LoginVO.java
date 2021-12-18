package com.maze.project.web.vo;

import lombok.Data;
import lombok.ToString;

import javax.validation.constraints.NotBlank;

@Data
@ToString
public class LoginVO {

    @NotBlank(message = "name不能为空")
    private String name;
    @NotBlank(message = "password不能为空")
    private String password;
}
