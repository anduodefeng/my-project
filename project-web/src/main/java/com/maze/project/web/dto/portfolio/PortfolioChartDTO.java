package com.maze.project.web.dto.portfolio;

import com.maze.project.web.dto.common.PieDTO;
import lombok.Data;

import java.util.List;

@Data
public class PortfolioChartDTO {

    //饼图用数据
    List<PieDTO> pieList;
    //基金总金额
    List<String> dateList;
    //总金额
    List<Double> totalAmount;
    //总成本
    List<Double> totalPrincipal;
}
