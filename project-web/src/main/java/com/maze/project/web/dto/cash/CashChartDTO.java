package com.maze.project.web.dto.cash;

import com.maze.project.web.dto.common.BarValueDTO;
import com.maze.project.web.dto.common.PieDTO;
import lombok.Data;

import java.util.List;

@Data
public class CashChartDTO {

    List<PieDTO> pieList;

    List<String> bankNameList;

    List<BarValueDTO> bankValueList;
}
