package com.maze.project.web.dto.credit_card;

import lombok.Data;

import java.util.List;

@Data
public class DetailChartDTO {

    private List<String> dateList;

    private List<Double> moneyList;
}
