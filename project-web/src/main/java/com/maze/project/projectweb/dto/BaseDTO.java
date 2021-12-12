package com.maze.project.projectweb.dto;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class BaseDTO {

    private int code;

    private String message;

    private Object data;
}
