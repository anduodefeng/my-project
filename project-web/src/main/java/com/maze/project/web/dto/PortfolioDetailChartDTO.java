package com.maze.project.web.dto;

import lombok.Data;

import java.util.List;

@Data
public class PortfolioDetailChartDTO {

    private List<String> dateList;

    private List<List<Double>> dataList;

    private List<Double> rateList;
}
