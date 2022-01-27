package com.maze.project.web.dto.credit_card;

import com.maze.project.web.dto.common.PieDTO;
import lombok.Data;

import java.util.List;

@Data
public class CashChartDTO {

    List<PieDTO> pieList;

    List<String> bankNameList;

    List<Double> bankValueList;
}
