package com.maze.project.web.dto.common;

import lombok.Data;

import java.util.List;

@Data
public class ManyLineDTO {

    private String name;
    private String type = "line";
    private String stack = "Total";
    private List<Double> data;
}