package com.maze.project.web.dto.cash;

import lombok.Data;

@Data
public class PieDTO {

    private String name;

    private double value;

    private PieItemColor itemStyle;
}
