package com.maze.project.web.dto.fund;

import com.maze.project.web.dto.common.BarValueDTO;
import com.maze.project.web.dto.common.PieDTO;
import lombok.Data;

import java.util.List;

@Data
public class PortfolioChartDTO {

    List<PieDTO> pieList;

    List<String> portfolioNameList;

    List<BarValueDTO> profitRateList;
}
