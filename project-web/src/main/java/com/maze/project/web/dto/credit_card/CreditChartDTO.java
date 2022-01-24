package com.maze.project.web.dto.credit_card;

import com.maze.project.web.dto.common.BarValueDTO;
import lombok.Data;

import java.util.List;

@Data
public class CreditChartDTO {

    private List<String> monthList;

    private List<BarValueDTO> CMBList;

    private List<BarValueDTO> PABList;
}
