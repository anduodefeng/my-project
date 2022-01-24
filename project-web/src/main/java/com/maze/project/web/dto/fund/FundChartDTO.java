package com.maze.project.web.dto.fund;

import com.maze.project.web.dto.common.BarValueDTO;
import com.maze.project.web.dto.common.PieDTO;

import java.util.List;

public class FundChartDTO {

    List<PieDTO> pieList;

    List<String> bankNameList;

    List<BarValueDTO> bankValueList;
}
