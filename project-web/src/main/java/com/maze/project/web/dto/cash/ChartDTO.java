package com.maze.project.web.dto.cash;

import lombok.Data;

import java.util.List;

@Data
public class ChartDTO {

    List<PieDTO> pieList;

    List<String> bankNameList;

    List<BarValueDTO> bankValueList;
}
