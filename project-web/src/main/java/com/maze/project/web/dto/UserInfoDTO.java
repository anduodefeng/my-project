package com.maze.project.web.dto;

import lombok.Data;

import java.util.List;

@Data
public class UserInfoDTO {

    private String avatar;

    private List<String> roles;
}
