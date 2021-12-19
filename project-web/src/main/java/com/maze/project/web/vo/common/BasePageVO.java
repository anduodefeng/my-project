package com.maze.project.web.vo.common;

import lombok.Data;

import javax.validation.constraints.Min;

@Data
public class BasePageVO {

    @Min(value = 1)
    private int page;
    @Min(value = 1)
    private int pageSize;
}
