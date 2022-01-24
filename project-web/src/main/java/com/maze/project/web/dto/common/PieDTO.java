package com.maze.project.web.dto.common;

import com.maze.project.web.dto.cash.PieItemColor;
import lombok.Data;

@Data
public class PieDTO {

    private String name;

    private double value;

    private PieItemColor itemStyle;
}
