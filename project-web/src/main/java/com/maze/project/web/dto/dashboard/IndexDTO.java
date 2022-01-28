package com.maze.project.web.dto.dashboard;

import com.maze.project.web.dto.common.PieDTO;
import lombok.Data;

import java.util.List;

@Data
public class IndexDTO {

    private double totalAssets;

    private double totalProfit;

    private double yesterdayProfit;
    //饼图用数据
    List<PieDTO> pieList;

    //总资产每日折线图
    List<String> dateList;
    List<Double> moneyList;
}
