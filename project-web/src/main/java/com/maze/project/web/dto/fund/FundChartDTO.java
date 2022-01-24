package com.maze.project.web.dto.fund;

import com.maze.project.web.dto.common.PieDTO;
import lombok.Data;

import java.util.List;

@Data
public class FundChartDTO {

    List<PieDTO> pieList;

    List<String> fundNameList;

    List<Double> profitRateList;
}
