package com.maze.project.web.dto.fund;

import lombok.Data;

import java.util.List;

@Data
public class FundDetailChartDTO {

    private List<String> dateList;

    private List<List<Double>> dataList;
}
